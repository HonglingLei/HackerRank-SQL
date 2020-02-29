select t2.hacker_id, t3.name, t2.total_score 
from
    (select hacker_id, sum(highest_score) as total_score 
    from
        (select hacker_id, challenge_id, max(score) as highest_score 
         from Submissions
         where score != 0
         group by hacker_id, challenge_id) t1
    group by hacker_id) t2
left join Hackers t3
on t2.hacker_id = t3.hacker_id
order by total_score desc, hacker_id asc
