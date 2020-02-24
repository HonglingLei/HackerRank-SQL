select sum(t1.population) from CITY t1
join COUNTRY t2
on t1.countrycode = t2.code
where continent = 'Asia'