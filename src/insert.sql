insert into локация(название, размер, ресурсы) values ('вода', 1000, true);
insert into локация(название, размер, ресурсы) values ('вода и скалистая суша', 800, true);
insert into локация(название, размер, ресурсы) values ('вода и лес', 1500, true);
insert into локация(название, размер, ресурсы) values ('скалистая суша', 500, false);
insert into локация(название, размер, ресурсы) values ('лес', 2500, true);

insert into виды(название, скорость_роста_энергии) values ('телепат', 2);
insert into виды(название, пр_локация, скорость_роста_энергии) values ('огненный', 2, 8);
insert into виды(название, пр_локация, скорость_роста_энергии) values ('водный', 1, 5);
insert into виды(название, пр_локация, скорость_роста_энергии) values ('земляной', 4, 2);

insert into порода_зверька(название, сила, макс_энергия, гибрид, описание) values ('думик', 2, 5, false, 'Умеет читать не только книги, но и мысли');
insert into порода_зверька(название, сила, макс_энергия, гибрид, описание) values ('огонек', 5, 35, false, 'Хорошо ладит с людьми и всегда поможет разжечь камин');
insert into порода_зверька(название, сила, макс_энергия, гибрид, описание) values ('булькохвост', 4, 30, false, 'Прекрасно уживается в домашних аквариумов и бассейнов');
insert into порода_зверька(название, сила, макс_энергия, гибрид, описание) values ('землерой', 3, 20, false, 'Устроит бардак в любом доме, но не со зла - сделайте ему песочницу и ваши вещи останутся в целости и сохранности');
insert into порода_зверька(название, сила, макс_энергия, гибрид, описание) values ('амфибиус', 6, 35, true, 'Активный зверек, нуждающийся в своем водоеме. Непригоден для квартир');
insert into порода_зверька(название, сила, макс_энергия, гибрид, описание) values ('Озерный думик', 3, 10, true, 'Эти думики работают на министерство, сидя на дне они генерируют идеи, проектируют здания и даже создают новые заклинания');

insert into зверек_вид(ид_порода, вид) values (1, 'телепат');
insert into зверек_вид(ид_порода,вид) values (2, 'огненный');
insert into зверек_вид(ид_порода, вид) values (3, 'водный');
insert into зверек_вид(ид_порода, вид) values (4, 'земляной');
insert into зверек_вид(ид_порода, вид) values (5, 'водный');
insert into зверек_вид(ид_порода, вид) values (5, 'земляной');
insert into зверек_вид(ид_порода, вид) values (6, 'телепат');
insert into зверек_вид(ид_порода, вид) values (6, 'телепат');

insert into маги(имя, фамилия, ранг) values ('Ньют', 'Саламандер', 1);
insert into маги(имя, фамилия, ранг) values ('Пропентина', 'Голдштейн', 2);
insert into маги(имя, фамилия, ранг) values ('Геллерт', 'Гриндевальд', 1);
insert into маги(имя, фамилия, ранг) values ('Лета', 'Лестрейндж', 3);

insert into чемодан(владелец) values (1);

insert into чемодан_локации(ид_локация, ид_чемодан) values (1, 1);
insert into чемодан_локации(ид_локация, ид_чемодан) values (2, 1);
insert into чемодан_локации(ид_локация, ид_чемодан) values (3, 1);
insert into чемодан_локации(ид_локация, ид_чемодан) values (4, 1);
insert into чемодан_локации(ид_локация, ид_чемодан) values (5, 1);

insert into зверек(ид_порода, магия, кличка, обнуление) values (1, 'светлая', 'Милли', '2021-2-5'::timestamp);
insert into зверек(ид_порода, магия, кличка, обнуление) values (2, 'светлая', 'Фрэнк', '2021-2-5'::timestamp);
insert into зверек(ид_порода, магия, кличка, обнуление) values (3, 'светлая', 'Поппи', '2021-2-5'::timestamp);
insert into зверек(ид_порода, магия, кличка, обнуление) values (4, 'светлая', 'Марлоу', '2021-2-5'::timestamp);
insert into зверек(ид_порода, магия, кличка, обнуление) values (5, 'светлая', 'Том', '2021-2-5'::timestamp);
insert into зверек(ид_порода, магия, кличка, обнуление) values (5, 'темная', 'Дугал', '2021-2-5'::timestamp);
insert into зверек(ид_порода, магия, кличка, обнуление) values (6, 'светлая', 'Скайс', '2021-2-5'::timestamp);
insert into зверек(ид_порода, магия, кличка, обнуление) values (6, 'светлая', 'Эйнштейн', '2021-2-5'::timestamp);
insert into зверек(ид_порода, магия, кличка, обнуление) values (6, 'светлая', 'Эдвард', '2021-2-5'::timestamp);
insert into зверек(ид_порода, магия, кличка, обнуление) values (3, 'светлая', 'Акулус', '2021-2-5'::timestamp);
insert into зверек(ид_порода, магия, кличка, обнуление) values (4, 'светлая', 'Нюхль', '2021-2-5'::timestamp);

insert into зверьки_в_чемодане(ид_чемодан, ид_зверек, ид_локация) values (1, 1, 1);
insert into зверьки_в_чемодане(ид_чемодан, ид_зверек, ид_локация) values (1, 2, 2);
insert into зверьки_в_чемодане(ид_чемодан, ид_зверек, ид_локация) values (1, 3, 3);
insert into зверьки_в_чемодане(ид_чемодан, ид_зверек, ид_локация) values (1, 4, 4);
insert into зверьки_в_чемодане(ид_чемодан, ид_зверек, ид_локация) values (1, 5, 5);
insert into зверьки_в_чемодане(ид_чемодан, ид_зверек, ид_локация) values (1, 6, 1);
insert into зверьки_в_чемодане(ид_чемодан, ид_зверек, ид_локация) values (1, 7, 2);
insert into зверьки_в_чемодане(ид_чемодан, ид_зверек, ид_локация) values (1, 8, 3);
insert into зверьки_в_чемодане(ид_чемодан, ид_зверек, ид_локация) values (1, 9, 4);
insert into зверьки_в_чемодане(ид_чемодан, ид_зверек, ид_локация) values (1, 10, 5);


insert into задания(название, сложность, ид_автор, начало, конец)
values ('Уборка чемодана', '1', '1', '2021-2-1'::timestamp, '2021-2-5'::timestamp);
insert into задания(название, сложность, ид_автор, начало, конец)
values ('Разбор документов', '1', '2', '2021-2-6'::timestamp, '2021-2-7'::timestamp);
insert into задания(название, сложность, ид_автор, начало, конец)
values ('Чистка бассейна', '3', '3', '2021-12-13'::timestamp, '2021-12-14'::timestamp);
insert into задания(название, сложность, ид_автор, начало, конец)
values ('Создание плана домиков', '3', '4', '2021-12-13'::timestamp, '2021-12-15'::timestamp);
insert into задания(название, сложность, ид_автор, начало, конец)
values ('Разработка туннелей', '5', '3', '2021-12-16'::timestamp, '2021-12-24'::timestamp);
insert into задания(название, сложность, ид_автор, начало, конец)
values ('Поимка страуса', '3', '4', '2021-12-11'::timestamp, '2021-12-15'::timestamp);


insert into помощники(ид_зверек, ид_задание) values (1, 1);
insert into помощники(ид_зверек, ид_задание) values (2, 2);

insert into ответственные(ид_зверек, ид_маг)  values (1, 1);
insert into ответственные(ид_зверек, ид_маг)  values (2, 1);
insert into ответственные(ид_зверек, ид_маг)  values (3, 1);
insert into ответственные(ид_зверек, ид_маг)  values (4, 3);
insert into ответственные(ид_зверек, ид_маг)  values (5, 2);
insert into ответственные(ид_зверек, ид_маг)  values (6, 2);
insert into ответственные(ид_зверек, ид_маг)  values (7, 2);
insert into ответственные(ид_зверек, ид_маг)  values (8, 4);
insert into ответственные(ид_зверек, ид_маг)  values (9, 3);
insert into ответственные(ид_зверек, ид_маг)  values (10, 4);

insert into лаборатории(ид_зверек, ответственный) values (1, 1);
insert into запись_лаборатория(ид_лаборатория, ид_зверек, дата_время) values (1, 4, '2021-10-7'::timestamp);
insert into тесты(описание, тип_результата) values ('телепат', 'boolean');
insert into тесты(описание, тип_результата) values ('огненный', 'boolean');
insert into тесты(описание, тип_результата) values ('водный', 'boolean');
insert into тесты(описание, тип_результата) values ('земляной', 'boolean');
insert into тесты(описание, тип_результата) values ('сила', 'integer');