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
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
   `location`  varchar(255),
   `birthdate`  date,
  primary key (`oid`)
);


-- Angel [ent1]
create table `angel` (
   `user_oid`  integer  not null,
   `profession`  varchar(255),
   `picture`  varchar(255),
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
  primary key (`deliverymethod_oid`)
);


-- Delivery [ent16]
create table `delivery` (
   `deliverymethod_oid`  integer  not null,
  primary key (`deliverymethod_oid`)
);


-- Requests [ent17]
create table `requests` (
   `oid`  integer  not null,
   `status`  varchar(255),
  primary key (`oid`)
);


-- Notification [ent18]
create table `notification` (
   `oid`  integer  not null,
   `dateseen`  date,
  primary key (`oid`)
);


-- Transaction [ent19]
create table `transaction` (
   `oid`  integer  not null,
   `ondate`  date,
  primary key (`oid`)
);


-- Choice [ent2]
create table `choice` (
   `deliverymethod_oid`  integer  not null,
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
  primary key (`user_oid`)
);


-- Homeless [ent3]
create table `homeless` (
   `user_oid`  integer  not null,
   `nickname`  varchar(255),
   `yearsonstreet`  integer,
  primary key (`user_oid`)
);


-- Message [ent4]
create table `message` (
   `oid`  integer  not null,
   `title`  varchar(255),
   `body`  varchar(255),
   `datetime`  datetime,
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
alter table `user`  add column  `group_oid_2`  integer;
alter table `user`   add index fk_user_group (`group_oid_2`), add constraint fk_user_group foreign key (`group_oid_2`) references `group` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group_2` (
   `user_oid`  integer not null,
   `group_oid`  integer not null,
  primary key (`user_oid`, `group_oid`)
);
alter table `user_group_2`   add index fk_user_group_2_user (`user_oid`), add constraint fk_user_group_2_user foreign key (`user_oid`) references `user` (`oid`);
alter table `user_group_2`   add index fk_user_group_2_group (`group_oid`), add constraint fk_user_group_2_group foreign key (`group_oid`) references `group` (`oid`);


-- Disables [rel1]
alter table `user`  add column  `administrator_oid`  integer;
alter table `user`   add index fk_user_administrator (`administrator_oid`), add constraint fk_user_administrator foreign key (`administrator_oid`) references `administrator` (`user_oid`);


-- Transaction_Offer [rel10]
alter table `transaction`  add column  `offer_oid`  integer;
alter table `transaction`   add index fk_transaction_offer (`offer_oid`), add constraint fk_transaction_offer foreign key (`offer_oid`) references `offer` (`oid`);


-- Homeless_Requests [rel11]
alter table `requests`  add column  `homeless_oid`  integer;
alter table `requests`   add index fk_requests_homeless (`homeless_oid`), add constraint fk_requests_homeless foreign key (`homeless_oid`) references `homeless` (`user_oid`);


-- Requests_Offer [rel12]
alter table `requests`  add column  `offer_oid`  integer;
alter table `requests`   add index fk_requests_offer (`offer_oid`), add constraint fk_requests_offer foreign key (`offer_oid`) references `offer` (`oid`);


-- NotificationUser [rel13]
alter table `notification`  add column  `angel_oid`  integer;
alter table `notification`   add index fk_notification_user (`angel_oid`), add constraint fk_notification_user foreign key (`angel_oid`) references `user` (`oid`);


-- Notification_Requests [rel14]
alter table `requests`  add column  `notification_oid`  integer;
alter table `requests`   add index fk_requests_requestnotificatio (`notification_oid`), add constraint fk_requests_requestnotificatio foreign key (`notification_oid`) references `requestnotification` (`notification_oid`);


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


-- Recieves [rel19]
alter table `user`  add column  `message_oid`  integer;
alter table `user`   add index fk_user_message (`message_oid`), add constraint fk_user_message foreign key (`message_oid`) references `message` (`oid`);


-- Message_MessageNotification [rel20]
alter table `messagenotification`  add column  `message_oid`  integer;
alter table `messagenotification`   add index fk_messagenotification_message (`message_oid`), add constraint fk_messagenotification_message foreign key (`message_oid`) references `message` (`oid`);


-- Rates_Transaction [rel3]
alter table `transaction`  add column  `rates_oid`  integer;
alter table `transaction`   add index fk_transaction_rates (`rates_oid`), add constraint fk_transaction_rates foreign key (`rates_oid`) references `rates` (`oid`);


-- Angel_Offer1 [rel4]
alter table `offer`  add column  `angel_oid`  integer;
alter table `offer`   add index fk_offer_angel (`angel_oid`), add constraint fk_offer_angel foreign key (`angel_oid`) references `angel` (`user_oid`);


-- Offer_Type [rel5]
create table `offer_type` (
   `offer_oid`  integer not null,
   `tag_oid`  integer not null,
  primary key (`offer_oid`, `tag_oid`)
);
alter table `offer_type`   add index fk_offer_type_offer (`offer_oid`), add constraint fk_offer_type_offer foreign key (`offer_oid`) references `offer` (`oid`);
alter table `offer_type`   add index fk_offer_type_tag (`tag_oid`), add constraint fk_offer_type_tag foreign key (`tag_oid`) references `tag` (`oid`);


-- Sends [rel6]
alter table `message`  add column  `user_oid`  integer;
alter table `message`   add index fk_message_user (`user_oid`), add constraint fk_message_user foreign key (`user_oid`) references `user` (`oid`);


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


-- GEN FK: RequestNotification --> Notification
alter table `requestnotification`   add index fk_requestnotification_notific (`notification_oid`), add constraint fk_requestnotification_notific foreign key (`notification_oid`) references `notification` (`oid`);


-- GEN FK: MessageNotification --> Notification
alter table `messagenotification`   add index fk_messagenotification_notific (`notification_oid`), add constraint fk_messagenotification_notific foreign key (`notification_oid`) references `notification` (`oid`);


-- Angel.annonymous [ent1#att8]
-- Unable to compute the view for the derived element 'annonymous [ent1#att8]'
-- com.webratio.ide.derivation.DerivationException: Unable to generate view for attribute: annonymous [ent1#att8] ()
-- 	at com.webratio.ide.derivation.DerivationPlugin.getAttributeQueryDoc(DerivationPlugin.java:261)
-- 	at com.webratio.ide.derivation.DerivationPlugin.getQueryDoc(DerivationPlugin.java:203)
-- 	at com.webratio.ide.derivation.DerivationPlugin.getQuery(DerivationPlugin.java:126)
-- 	at com.webratio.ide.ui.dbsync.SQLGenerator.getAddView(SQLGenerator.java:884)
-- 	at com.webratio.ide.ui.dbsync.SQLGenerator.generateSQL(SQLGenerator.java:320)
-- 	at com.webratio.ide.ui.dbsync.wizards.SQLPage$3.run(SQLPage.java:223)
-- 	at org.eclipse.jface.operation.ModalContext$ModalContextThread.run(ModalContext.java:121)
-- Caused by: com.webratio.ide.derivation.internal.parser.ParseException: Encountered "<EOF>" at line 0, column 0.
-- Was expecting one of:
--     <AGGRFUNCTION> ...
--     "Self" ...
--     <IDENTIFIER> ...
--     <STRING> ...
--     <NUMBER> ...
--     "(" ...
--     
-- 	at com.webratio.ide.derivation.internal.parser.OQLParser.generateParseException(OQLParser.java:2429)
-- 	at com.webratio.ide.derivation.internal.parser.OQLParser.jj_consume_token(OQLParser.java:2287)
-- 	at com.webratio.ide.derivation.internal.parser.OQLParser.AttributeValue(OQLParser.java:528)
-- 	at com.webratio.ide.derivation.internal.parser.OQLParser.AttributeQuery(OQLParser.java:1497)
-- 	at com.webratio.ide.derivation.DerivationPlugin.getAttributeQueryDoc(DerivationPlugin.java:259)
-- 	... 6 more


