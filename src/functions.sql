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