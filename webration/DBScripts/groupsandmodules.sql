insert into `module` values
(1, 'sv4', 'Homeless Page'),
(2, 'sv3', 'Angels Page'),
(3, 'sv5', 'Administrator Page'),
(4, 'area1', 'Registered User');
insert into `group` values
(1, 'homeless', 1),
(2, 'angels', 2),
(3, 'administrators', 3);
insert into group_module values
(1,4),
(2,4);
insert into user (oid, username, password, email, location, birthdate, isDisabled, group_oid_2) values
(1, "admin", "admin", "admin@admin.be", "Brussels", "1990-01-01", 0, 3);
insert into administrator values
(1);