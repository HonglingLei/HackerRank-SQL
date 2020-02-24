select t1.NAME from CITY t1
inner join 
    (select * from COUNTRY 
     where CONTINENT = 'Africa')t2
on t1.COUNTRYCODE = t2.Code

-- 这个题差点错，因为之前选的是left join。后来发现必须要满足两张表都有，所以只有inner join可以。