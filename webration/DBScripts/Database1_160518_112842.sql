-- Message [ent4]
alter table `message`  add column  `datetime`  datetime;


-- REL FK: NotificationToRequests [rel14#role27]
alter table `requests`   add index fk_requests_requestnotificatio (`notification_oid`), add constraint fk_requests_requestnotificatio foreign key (`notification_oid`) references `requestnotification` (`notification_oid`);


