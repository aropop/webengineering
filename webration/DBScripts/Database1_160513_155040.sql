-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user`  add column  `group_oid_2`  integer;
alter table `user`   add index fk_user_group_2 (`group_oid_2`), add constraint fk_user_group_2 foreign key (`group_oid_2`) references `group` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group_2` (
   `user_oid`  integer not null,
   `group_oid`  integer not null,
  primary key (`user_oid`, `group_oid`)
);
alter table `user_group_2`   add index fk_user_group_2_user (`user_oid`), add constraint fk_user_group_2_user foreign key (`user_oid`) references `user` (`oid`);
alter table `user_group_2`   add index fk_user_group_2_group (`group_oid`), add constraint fk_user_group_2_group foreign key (`group_oid`) references `group` (`oid`);


