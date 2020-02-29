select
B.id, B.age, B.coins_needed, B.power
from
    (select
    Wands.power as power,
    Wands_Property.age as age,
    min(coins_needed) as coins_needed
    from Wands 
    left join Wands_Property 
    on Wands.code = Wands_Property.code
    where Wands_Property.is_evil = 0
    group by power,age) A /*关键的关键！！！类似于实现了partition的功能*/
left join
    (select 
    Wands.id,
    Wands.power power,
    Wands_Property.age age,
    Wands.coins_needed
    from Wands 
    left join Wands_Property 
    on Wands.code = Wands_Property.code
    where Wands_Property.is_evil = 0
    ) B
using(power, age, coins_needed) /*和on的区别在于适用两个表的column同名时。括号里有多个表示这些条件要全部满足地去match*/
order by power desc, age desc