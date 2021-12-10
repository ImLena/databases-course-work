
create or replace function mag_tasks_add() returns trigger
as $$
begin
    if (exists (select ид_автор
                from задания
                where ид_автор = new.ид_автор
                  and
                    (начало >= new.начало
                         and
                     начало <= new.конец
                        or
                     начало <= new.начало
                         and
                     конец >= new.начало)
        )
        )
    then  raise exception 'этот маг уже находится на другом задании в выбранное время';
    return null;
    end if;
    return new;
end;
$$ language plpgsql;


create trigger mag_tasks_add
    before insert or update on задания
    for each row
execute procedure mag_tasks_add();


create or replace function animal_tasks_add() returns trigger
as $$
declare
    start timestamp;
    finish timestamp;
begin
    create temp table taskss as select ид_задание
                                from помощники
                                where ид_зверек = new.ид_зверек;
    select начало into start from задания where задания.ид_задание = new.ид_задание;
    select конец  into finish from задания where задания.ид_задание = new.ид_задание;
    if (exists (select ид_задание
                from задания
                where ид_задание in (select ид_задание from taskss)
                  and
                    (начало >= start
                         and
                     начало <= finish
                        or
                     начало <= start
                         and
                     конец >= finish)
        )
        )
    then  raise exception 'этот зверек уже находится на другом задании в выбранное время';
    return null;
    end if;
    return new;
end;
$$ language plpgsql;

create trigger animal_tasks_add
    before insert or update on помощники
    for each row
execute procedure animal_tasks_add();


create or replace function assistant_add() returns setof trigger as $assistant_add$
begin
    if exists (select ид_беглец from беглецы where ид_беглец = new.ид_зверек) then
        raise exception 'невозможно взять зверька на задание, так как он является беглецом';
    end if;
    return new;
end;
$assistant_add$ language 'plpgsql';

create trigger assistant_add
    before insert or update on помощники
    for each row
execute procedure assistant_add();

create or replace function escapee_add() returns setof trigger as $escapee_add$
begin
    if exists (select ид_зверек from помощники where ид_зверек = new.ид_беглец) then
        delete from помощники where ид_зверек = new.ид_беглец;
    end if;
    return new;
end;
$escapee_add$ language 'plpgsql';


create trigger escapee_add
    before insert or update on беглецы
    for each row
execute procedure escapee_add();

create or replace function add_location() returns trigger
as $$
begin
    if (not exists(select ид_локация
                   from чемодан_локации
                   where ид_чемодан = new.ид_чемодан
        )
        )
    then  raise exception 'такой локации нет в чемодане';
    return null;
    end if;
    return new;
end;
$$ language plpgsql;


create trigger mag_tasks_add
    before insert or update on зверьки_в_чемодане
    for each row
execute procedure add_location();


