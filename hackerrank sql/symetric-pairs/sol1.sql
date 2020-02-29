select distinct a.x as w, a.y 
from Functions a, Functions b 
where a.x = b.y and b.x = a.y and a.x < b.x 
union all 
select a1.x as w, a1.y from Functions a1 
where a1.x = a1.y 
group by a1.x, a1.y 
having count(*)>1 
order by w