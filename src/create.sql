create table маги(
                     ид_маг serial primary key,
                     имя text not null,
                     фамилия text not null,
                     ранг integer not null,
                     check ( ранг > 0 )
);

create table локация(
                        ид_локация serial primary key,
                        название text not null,
                        размер integer not null,
                        ресурсы boolean,
                        check ( размер > 0 )
);

create table книга(
                      ид_записи serial primary key,
                      порода integer not null,
                      автор_записи integer,
                      foreign key (автор_записи) references маги(ид_маг)
);

create table порода_зверька(
                               ид_порода serial primary key,
                               название text,
                               сила integer,
                               макс_энергия integer,
                               гибрид boolean,
                               описание text,
                               check ( сила > 0 ),
                               check ( макс_энергия > 0 )
);

create table зверек(
                       ид_зверек serial primary key,
                       ид_порода integer,
                       кличка text,
                       магия text,
                       обнуление timestamp,
                       foreign key (ид_порода) references порода_зверька(ид_порода)

);

create table виды(
                     название text not null unique,
                     пр_локация integer,
                     скорость_роста_энергии integer not null,
                     check (скорость_роста_энергии > 0),
                     foreign key (пр_локация) references локация(ид_локация)
);

create table зверек_вид(
                           ид_зверек integer not null,
                           ид_вид text not null,
                           foreign key (ид_зверек) references зверек(ид_зверек),
                           foreign key (ид_вид) references виды(название)
);

create table чемодан(
                        ид_чемодан serial primary key,
                        владелец integer not null,
                        foreign key (владелец) references маги(ид_маг)
);

create table зверьки_в_чемодане(
                                   ид_чемодан integer not null,
                                   ид_зверек integer not null,
                                   ид_локация integer,
                                   foreign key (ид_чемодан) references чемодан(ид_чемодан),
                                   foreign key (ид_зверек) references зверек(ид_зверек),
                                   foreign key (ид_локация) references локация(ид_локация),
                                   primary key (ид_чемодан, ид_зверек)
);

create table беглецы(
                        ид_беглец integer not null primary key,
                        статус text,
                        foreign key (ид_беглец) references зверек(ид_зверек)
);

create table задания(
                        ид_задание serial primary key,
                        название text not null,
                        сложность integer not null,
                        ид_автор integer not null,
                        начало timestamp not null,
                        конец timestamp not null,
                        foreign key (ид_автор) references маги(ид_маг),
                        check ( начало < конец )
);

create table помощники(
                          ид_зверек integer not null,
                          ид_задание integer not null,
                          foreign key (ид_зверек) references зверек(ид_зверек),
                          foreign key (ид_задание) references задания(ид_задание),
                          primary key (ид_зверек, ид_задание)
);

create table чемодан_локации (
                                 ид_локация integer not null references локация(ид_локация),
                                 ид_чемодан integer not null references чемодан(ид_чемодан)
);

create table ответственные (
                               ид_зверек integer not null references зверек(ид_зверек),
                               ид_маг integer not null references маги(ид_маг)
);

create table лаборатории (
                             ид_лаборатория serial primary key,
                             ид_зверек integer references зверек(ид_зверек),
                             ответственный integer not null references маги(ид_маг)
);

create table запись_лаборатория (
                                    ид_лаборатория integer references лаборатории(ид_лаборатория),
                                    ид_зверек integer references зверек (ид_зверек),
                                    дата_время timestamp unique
);

create table тесты (
                       ид_тест serial primary key,
                       описание text not null,
                       тип_результата text not null
);

create table результаты_исследований (
                                         ид_тест integer references тесты(ид_тест),
                                         ид_зверек integer references зверек (ид_зверек),
                                         результат integer
);

