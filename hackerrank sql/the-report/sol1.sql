select 
    case when Marks<70 then Null else Name end as NewName, 
    case when Marks<10 then 1
        when Marks<20 then 2
        when Marks>=20 and Marks<30 then 3
        when Marks>=30 and Marks<40 then 4
        when Marks>=40 and Marks<50 then 5
        when Marks>=50 and Marks<60 then 6
        when Marks>=60 and Marks<70 then 7
        when Marks>=70 and Marks<80 then 8
        when Marks>=80 and Marks<90 then 9
        else 10 end as Grade,
    Marks
from Students
order by Grade desc, Name asc, Marks asc