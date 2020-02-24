select t2.continent, floor(avg(t1.population)) from CITY t1
inner join COUNTRY t2
on t1.countrycode = t2.code
group by t2.continent

-- round DOWN to the nearest integer所以不能用round(x,0)因为这样会四舍五入而不是DOWN