create or replace function check_places(чемодан integer, ид_локации integer) returns integer as $$
declare
    animals integer;
    size integer;
begin
    select count(ид_зверек) into animals from зверьки_в_чемодане where зверьки_в_чемодане.ид_чемодан = чемодан;
    select размер into size from локация where локация.ид_локация = ид_локации;
    return size - animals * 5;
end;
$$ language plpgsql;

create or replace procedure entrollment_laboratory(ид_лаборатория integer, ид_зверек integer, дата_время timestamp) as $$
begin
    insert into запись_лаборатория(ид_лаборатория, ид_зверек, дата_время) values(ид_лаборатория, ид_зверек, дата_время);
end;
$$ language plpgsql;

create or replace function check_priority_location(порода integer) returns integer as $$
declare
    res integer;
begin
    select пр_локация into res from виды where название in (
    select вид from зверек_вид where зверек_вид.ид_порода = порода) limit 1;
    return res;
end;
$$ language plpgsql;

create or replace function check_energy(id_creature integer) returns integer as $check_energy$
    declare
        res integer;
        zeroing timestamp;
        speed integer;
        max_energy integer;
        days integer;
    begin
        res := 0;
        if(select порода_зверька.гибрид = true
            from зверек join порода_зверька using(ид_порода) where зверек.ид_зверек = id_creature) then
            select sum(скорость_роста_энергии), обнуление, макс_энергия  into speed, zeroing, max_energy
                from зверек join порода_зверька
                    пз on пз.ид_порода = зверек.ид_порода join зверек_вид зв on зверек.ид_зверек = зв.ид_зверек
                        join виды в on зв.ид_вид = в.название where зверек.ид_зверек = id_creature group by 2, 3;
            else
                select скорость_роста_энергии, обнуление, макс_энергия  into speed, zeroing, max_energy
                from зверек join порода_зверька
                    пз on пз.ид_порода = зверек.ид_порода join зверек_вид зв on зверек.ид_зверек = зв.ид_зверек
                            join виды в on зв.ид_вид = в.название where зверек.ид_зверек = id_creature group by 1, 2, 3;
            days := extract(day from age(current_date::timestamp, zeroing))::integer;
            res := ((((speed * days) % max_energy)::float / (max_energy::float)) * 100)::integer;
        end if;
        return res;
    end;
$check_energy$ language 'plpgsql';
