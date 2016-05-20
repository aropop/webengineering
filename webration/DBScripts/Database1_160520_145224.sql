-- Angel.givenAway [ent1#att21]
create view `angel_givenaway_view` as
select AL1.`user_oid` as `user_oid`, count(distinct AL2.`oid`) as `der_attr`
from  `angel` AL1 
               left outer join `transaction` AL2 on AL1.`user_oid`=AL2.`angel_oid`
group by AL1.`user_oid`;


