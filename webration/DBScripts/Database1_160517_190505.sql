-- Angel_Offer1 [rel4]
alter table `offer`  add column  `angel_oid`  integer;
alter table `offer`   add index fk_offer_angel (`angel_oid`), add constraint fk_offer_angel foreign key (`angel_oid`) references `angel` (`user_oid`);


