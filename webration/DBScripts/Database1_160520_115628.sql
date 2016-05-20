-- Angel.averageRating [ent1#att8]
create view `angel_averagerating_view` as
select AL1.`user_oid` as `user_oid`, avg(AL2.`stars`) as `der_attr`
from  `angel` AL1 
               left outer join `rates` AL2 on AL1.`user_oid`=AL2.`angel_oid`
group by AL1.`user_oid`;


