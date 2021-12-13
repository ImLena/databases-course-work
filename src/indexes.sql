create index з_ид_зверек on зверек using hash(ид_зверек);
create index пз_ид_порода on порода_зверька using hash(ид_порода);
create index ч_ид_чемодан on чемодан using hash(ид_чемодан);
create index л_ид_локация on локация using hash(ид_локация);