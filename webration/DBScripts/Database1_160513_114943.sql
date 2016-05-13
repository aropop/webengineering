-- Group [Group]
create table `group` (
   `oid`  integer  not null,
   `groupname`  varchar(255),
  primary key (`oid`)
);


-- Module [Module]
create table `module` (
   `oid`  integer  not null,
   `moduleid`  varchar(255),
   `modulename`  varchar(255),
  primary key (`oid`)
);


-- User [User]
create table `user` (
   `oid`  integer  not null,
   `name`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
   `birthdate`  date,
   `location`  varchar(255),
  primary key (`oid`)
);


-- Angel [ent1]
create table `angel` (
   `user_oid`  integer  not null,
   `oid`  integer  not null,
   `profession`  varchar(255),
   `picture`  varchar(255),
   `annonymous`  bit,
  primary key (`user_oid`)
);


-- Picture [ent12]
create table `picture` (
   `oid`  integer  not null,
   `picture`  varchar(255),
  primary key (`oid`)
);


-- DeliveryMethod [ent13]
create table `deliverymethod` (
   `oid`  integer  not null,
   `address`  varchar(255),
   `name`  varchar(255),
  primary key (`oid`)
);


-- PickUp [ent15]
create table `pickup` (
   `deliverymethod_oid`  integer  not null,
   `oid`  integer  not null,
  primary key (`deliverymethod_oid`)
);


-- Delivery [ent16]
create table `delivery` (
   `deliverymethod_oid`  integer  not null,
   `oid`  integer  not null,
   `date`  date,
   `time`  time,
  primary key (`deliverymethod_oid`)
);


-- Requests [ent17]
create table `requests` (
   `oid`  integer  not null,
  primary key (`oid`)
);


-- Notification [ent18]
create table `notification` (
   `oid`  integer  not null,
   `dateseen`  bit,
  primary key (`oid`)
);


-- Transaction [ent19]
create table `transaction` (
   `oid`  integer  not null,
  primary key (`oid`)
);


-- Choice [ent2]
create table `choice` (
   `deliverymethod_oid`  integer  not null,
   `oid`  integer  not null,
   `date`  date,
   `time`  time,
  primary key (`deliverymethod_oid`)
);


-- Rates [ent20]
create table `rates` (
   `oid`  integer  not null,
   `stars`  integer,
   `comment`  varchar(255),
  primary key (`oid`)
);


-- Donation [ent21]
create table `donation` (
   `oid`  integer  not null,
   `amount`  integer,
   `comment`  varchar(255),
   `date`  date,
  primary key (`oid`)
);


-- GeneralInformation [ent22]
create table `generalinformation` (
   `oid`  integer  not null,
   `subject`  varchar(255),
   `info`  varchar(255),
  primary key (`oid`)
);


-- Administrator [ent23]
create table `administrator` (
   `user_oid`  integer  not null,
   `oid`  integer  not null,
  primary key (`user_oid`)
);


-- Homeless [ent3]
create table `homeless` (
   `user_oid`  integer  not null,
   `nickname`  varchar(255)  not null,
   `yearsonstreet`  integer,
  primary key (`user_oid`)
);


-- Proffers [ent6]
create table `proffers` (
   `oid`  integer  not null,
  primary key (`oid`)
);


-- Offer [ent8]
create table `offer` (
   `oid`  integer  not null,
   `description`  varchar(255),
   `amount`  integer,
   `expirydate`  date,
   `name`  varchar(255),
  primary key (`oid`)
);


-- Tag [ent9]
create table `tag` (
   `oid`  integer  not null,
   `name`  varchar(255),
  primary key (`oid`)
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group`  add column  `module_oid`  integer;
alter table `group`   add index fk_group_module (`module_oid`), add constraint fk_group_module foreign key (`module_oid`) references `module` (`oid`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module` (
   `group_oid`  integer not null,
   `module_oid`  integer not null,
  primary key (`group_oid`, `module_oid`)
);
alter table `group_module`   add index fk_group_module_group (`group_oid`), add constraint fk_group_module_group foreign key (`group_oid`) references `group` (`oid`);
alter table `group_module`   add index fk_group_module_module (`module_oid`), add constraint fk_group_module_module foreign key (`module_oid`) references `module` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user`  add column  `group_oid`  integer;
alter table `user`   add index fk_user_group (`group_oid`), add constraint fk_user_group foreign key (`group_oid`) references `group` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group` (
   `user_oid`  integer not null,
   `group_oid`  integer not null,
  primary key (`user_oid`, `group_oid`)
);
alter table `user_group`   add index fk_user_group_user (`user_oid`), add constraint fk_user_group_user foreign key (`user_oid`) references `user` (`oid`);
alter table `user_group`   add index fk_user_group_group (`group_oid`), add constraint fk_user_group_group foreign key (`group_oid`) references `group` (`oid`);


-- Disables [rel1]
alter table `user`  add column  `administrator_oid`  integer;
alter table `user`   add index fk_user_administrator (`administrator_oid`), add constraint fk_user_administrator foreign key (`administrator_oid`) references `administrator` (`user_oid`);


-- Homeless_Requests [rel11]
alter table `requests`  add column  `homeless_oid`  integer;
alter table `requests`   add index fk_requests_homeless (`homeless_oid`), add constraint fk_requests_homeless foreign key (`homeless_oid`) references `homeless` (`user_oid`);


-- Requests_Offer [rel12]
alter table `requests`  add column  `offer_oid`  integer;
alter table `requests`   add index fk_requests_offer (`offer_oid`), add constraint fk_requests_offer foreign key (`offer_oid`) references `offer` (`oid`);


-- Notification_Angel [rel13]
alter table `notification`  add column  `angel_oid`  integer;
alter table `notification`   add index fk_notification_angel (`angel_oid`), add constraint fk_notification_angel foreign key (`angel_oid`) references `angel` (`user_oid`);


-- Notification_Requests [rel14]
alter table `requests`  add column  `notification_oid`  integer;
alter table `requests`   add index fk_requests_notification (`notification_oid`), add constraint fk_requests_notification foreign key (`notification_oid`) references `notification` (`oid`);


-- Transaction_Angel [rel15]
alter table `transaction`  add column  `angel_oid`  integer;
alter table `transaction`   add index fk_transaction_angel (`angel_oid`), add constraint fk_transaction_angel foreign key (`angel_oid`) references `angel` (`user_oid`);


-- Transaction_Homeless [rel16]
alter table `transaction`  add column  `homeless_oid`  integer;
alter table `transaction`   add index fk_transaction_homeless (`homeless_oid`), add constraint fk_transaction_homeless foreign key (`homeless_oid`) references `homeless` (`user_oid`);


-- Rates_Homeless [rel17]
alter table `rates`  add column  `homeless_oid`  integer;
alter table `rates`   add index fk_rates_homeless (`homeless_oid`), add constraint fk_rates_homeless foreign key (`homeless_oid`) references `homeless` (`user_oid`);


-- Rates_Angel [rel18]
alter table `rates`  add column  `angel_oid`  integer;
alter table `rates`   add index fk_rates_angel (`angel_oid`), add constraint fk_rates_angel foreign key (`angel_oid`) references `angel` (`user_oid`);


-- Angel_Offer [rel2]
alter table `proffers`  add column  `angel_oid`  integer;
alter table `proffers`   add index fk_proffers_angel (`angel_oid`), add constraint fk_proffers_angel foreign key (`angel_oid`) references `angel` (`user_oid`);


-- Rates_Transaction [rel3]
alter table `transaction`  add column  `rates_oid`  integer;
alter table `transaction`   add index fk_transaction_rates (`rates_oid`), add constraint fk_transaction_rates foreign key (`rates_oid`) references `rates` (`oid`);


-- Offer_Type [rel5]
create table `offer_type` (
   `offer_oid`  integer not null,
   `tag_oid`  integer not null,
  primary key (`offer_oid`, `tag_oid`)
);
alter table `offer_type`   add index fk_offer_type_offer (`offer_oid`), add constraint fk_offer_type_offer foreign key (`offer_oid`) references `offer` (`oid`);
alter table `offer_type`   add index fk_offer_type_tag (`tag_oid`), add constraint fk_offer_type_tag foreign key (`tag_oid`) references `tag` (`oid`);


-- Proffers_Offer [rel6]
alter table `offer`  add column  `proffers_oid`  integer;
alter table `offer`   add index fk_offer_proffers (`proffers_oid`), add constraint fk_offer_proffers foreign key (`proffers_oid`) references `proffers` (`oid`);


-- Offer_Picture [rel7]
alter table `picture`  add column  `offer_oid`  integer;
alter table `picture`   add index fk_picture_offer (`offer_oid`), add constraint fk_picture_offer foreign key (`offer_oid`) references `offer` (`oid`);


-- Offer_DeliveryMethod [rel9]
alter table `deliverymethod`  add column  `offer_oid`  integer;
alter table `deliverymethod`   add index fk_deliverymethod_offer (`offer_oid`), add constraint fk_deliverymethod_offer foreign key (`offer_oid`) references `offer` (`oid`);


-- GEN FK: PickUp --> DeliveryMethod
alter table `pickup`   add index fk_pickup_deliverymethod (`deliverymethod_oid`), add constraint fk_pickup_deliverymethod foreign key (`deliverymethod_oid`) references `deliverymethod` (`oid`);


-- GEN FK: Delivery --> DeliveryMethod
alter table `delivery`   add index fk_delivery_deliverymethod (`deliverymethod_oid`), add constraint fk_delivery_deliverymethod foreign key (`deliverymethod_oid`) references `deliverymethod` (`oid`);


-- GEN FK: Angel --> User
alter table `angel`   add index fk_angel_user (`user_oid`), add constraint fk_angel_user foreign key (`user_oid`) references `user` (`oid`);


-- GEN FK: Administrator --> User
alter table `administrator`   add index fk_administrator_user (`user_oid`), add constraint fk_administrator_user foreign key (`user_oid`) references `user` (`oid`);


-- GEN FK: Choice --> DeliveryMethod
alter table `choice`   add index fk_choice_deliverymethod (`deliverymethod_oid`), add constraint fk_choice_deliverymethod foreign key (`deliverymethod_oid`) references `deliverymethod` (`oid`);


-- GEN FK: Homeless --> User
alter table `homeless`   add index fk_homeless_user (`user_oid`), add constraint fk_homeless_user foreign key (`user_oid`) references `user` (`oid`);


