select months*salary, count(name) from Employee
group by months*salary
order by months*salary desc
limit 1