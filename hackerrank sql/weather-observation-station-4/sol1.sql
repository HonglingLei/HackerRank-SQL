/*
我错在把distinct后面加了括号...
*/
select count(city) - count(distinct city) from station
