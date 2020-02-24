select concat(name,"(",substr(occupation,1,1),")") from OCCUPATIONS
order by name;

select concat("There are a total of ", num, " ", prof, "s.") from
    (select lower(occupation) as prof, count(name) as num from OCCUPATIONS
    group by occupation
    order by num)t1;
    
--哇塞，居然可以写两个分开的sql。这样方便多了...