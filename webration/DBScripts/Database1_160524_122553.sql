-- User [User]
alter table `user`  add column  `usedname`  varchar(255);


-- Offer_Type [rel5]
alter table `tag`  add column  `offer_oid`  integer;
alter table `tag`   add index fk_tag_offer_2 (`offer_oid`), add constraint fk_tag_offer_2 foreign key (`offer_oid`) references `offer` (`oid`);


