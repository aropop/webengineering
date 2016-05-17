-- Transaction [ent19]
alter table `transaction`  add column  `ondate`  date;


-- Transaction_Offer [rel10]
alter table `transaction`  add column  `offer_oid`  integer;
alter table `transaction`   add index fk_transaction_offer (`offer_oid`), add constraint fk_transaction_offer foreign key (`offer_oid`) references `offer` (`oid`);


