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