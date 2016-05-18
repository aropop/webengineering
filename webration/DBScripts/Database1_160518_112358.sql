-- Message [ent4]
create table `message` (
   `oid`  integer  not null,
   `title`  varchar(255),
   `body`  varchar(255),
  primary key (`oid`)
);


-- RequestNotification [ent5]
create table `requestnotification` (
   `notification_oid`  integer  not null,
  primary key (`notification_oid`)
);


-- MessageNotification [ent6]
create table `messagenotification` (
   `notification_oid`  integer  not null,
  primary key (`notification_oid`)
);


-- Recieves [rel19]
alter table `user`  add column  `message_oid`  integer;
alter table `user`   add index fk_user_message (`message_oid`), add constraint fk_user_message foreign key (`message_oid`) references `message` (`oid`);


-- Message_MessageNotification [rel20]
alter table `messagenotification`  add column  `message_oid`  integer;
alter table `messagenotification`   add index fk_messagenotification_message (`message_oid`), add constraint fk_messagenotification_message foreign key (`message_oid`) references `message` (`oid`);


-- Sends [rel6]
alter table `message`  add column  `user_oid`  integer;
alter table `message`   add index fk_message_user (`user_oid`), add constraint fk_message_user foreign key (`user_oid`) references `user` (`oid`);


-- GEN FK: RequestNotification --> Notification
alter table `requestnotification`   add index fk_requestnotification_notific (`notification_oid`), add constraint fk_requestnotification_notific foreign key (`notification_oid`) references `notification` (`oid`);


-- GEN FK: MessageNotification --> Notification
alter table `messagenotification`   add index fk_messagenotification_notific (`notification_oid`), add constraint fk_messagenotification_notific foreign key (`notification_oid`) references `notification` (`oid`);


-- REL FK: AngelToNotification [rel13#role26]
alter table `notification`   add index fk_notification_user (`angel_oid`), add constraint fk_notification_user foreign key (`angel_oid`) references `user` (`oid`);


