select c.company_code, c.founder, count(distinct lm.lead_manager_code), 
count(distinct sm.senior_manager_code), count(distinct m.manager_code), 
count(distinct e.employee_code)
from Company c, Lead_Manager lm, Senior_Manager sm, Manager m, Employee e --select from后面可以接多个表
where c.company_code = lm.company_code
    and lm.lead_manager_code = sm.lead_manager_code
    and sm.senior_manager_code = m.senior_manager_code
    and m.manager_code = e.manager_code --这一串特别巧！层层套
group by c.company_code, c.founder --group by这种条件后面也可以接两个。先按前面的，如果一样，再按后面的
order by c.company_code