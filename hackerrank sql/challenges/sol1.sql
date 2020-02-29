select t5.hacker_id, t5.name, t5.challenges_created
from
    (select * from
        (select challenges_created, count(challenges_created) as num_people
        from
            (select hacker_id, name, challenges_created
            from
                (select hacker_id, count(challenge_id) as challenges_created 
                 from Challenges
                 group by hacker_id) t1
            left join Hackers H
            using (hacker_id)
            order by challenges_created desc) t2
        group by challenges_created desc) t3
    where num_people = 1 or challenges_created = 50) t4 /*这一步筛掉那些challenge个数一样（却又不是最大值）的人*/
inner join /*这一步就是把id，名字和challenge个数并进去*/
    (select hacker_id, name, challenges_created
            from
                (select hacker_id, count(challenge_id) as challenges_created 
                 from Challenges
                 group by hacker_id) t1
            left join Hackers H
            using (hacker_id)
            order by challenges_created desc) t5
using (challenges_created)
order by challenges_created desc, hacker_id