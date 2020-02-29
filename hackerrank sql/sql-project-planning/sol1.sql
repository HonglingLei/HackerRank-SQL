set sql_mode = '';
select Start_Date, End_Date
from 
    (select Start_Date from Projects 
     where Start_Date not in (select End_Date from Projects)) a,
    (select End_Date from Projects 
     where End_Date not in (select Start_Date from Projects)) b 
/*简直绝妙，选时间段本质上就是连接不同的小段，然后消除这些连接点（即去除start和end重合的点）*/
where Start_Date < End_Date
group by Start_Date 
group by DATEDIFF(End_Date, Start_Date), Start_Date 
/*先按duration排，再按StartDate排*/