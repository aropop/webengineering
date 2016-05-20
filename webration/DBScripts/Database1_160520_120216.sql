-- Angel.averageRating [ent1#att8]
drop view `angel_averagerating_view`;
create view `angel_averagerating_view` as
select AL1.`user_oid` as `user_oid`, avg(AL2.`stars`) as `der_attr`
from  `angel` AL1 
               left outer join `rates` AL2 on AL1.`user_oid`=AL2.`angel_oid`
               left outer join `user` AL4 on AL2.`angel_oid`=AL4.`oid`
               left outer join `user` AL3 on AL1.`user_oid`=AL3.`oid`
where AL3.`oid` = AL4.`oid`
group by AL1.`user_oid`;


