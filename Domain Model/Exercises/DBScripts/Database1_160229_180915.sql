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
  primary key (`oid`)
);


-- Company [ent1]
create table `company` (
   `oid`  integer  not null,
   `name`  varchar(255),
   `vat`  varchar(255),
   `address`  varchar(255),
   `phone_number`  varchar(255),
   `nationality`  varchar(255),
  primary key (`oid`)
);


-- Product [ent2]
create table `product` (
   `oid`  integer  not null,
   `name`  varchar(255),
   `model`  varchar(255),
   `price`  varchar(255),
   `date_of_production`  varchar(255),
   `picture`  varchar(255),
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


-- Company_Product [rel2]
alter table `product`  add column  `company_oid`  integer;
alter table `product`   add index fk_product_company (`company_oid`), add constraint fk_product_company foreign key (`company_oid`) references `company` (`oid`);


-- Company.# products [ent1#att13]
create view `company_products_view` as
select AL1.`oid` as `oid`, count(distinct AL2.`oid`) as `der_attr`
from  `company` AL1 
               left outer join `product` AL2 on AL1.`oid`=AL2.`company_oid`
group by AL1.`oid`;


