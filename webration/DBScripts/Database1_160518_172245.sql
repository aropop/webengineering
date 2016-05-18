-- Notification_User [rel2]
alter table `notification`  add column  `user_oid`  integer;
alter table `notification`   add index fk_notification_user_2 (`user_oid`), add constraint fk_notification_user_2 foreign key (`user_oid`) references `user` (`oid`);


