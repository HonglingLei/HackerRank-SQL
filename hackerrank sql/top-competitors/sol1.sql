select t6.hacker_id, t7.name
from
    (select t5.hacker_id, count(t5.challenge_id) as num_full from
        (select t3.hacker_id, t3.challenge_id, t3.difficulty_level, 
        t3.score as score_earned, t4.score as score_full
        from
            (select t1.hacker_id, t1.challenge_id, t2.difficulty_level, t1.score
            from Submissions t1
            left join Challenges t2
            on t1.challenge_id = t2.challenge_id) t3
        left join Difficulty t4
        on t3.difficulty_level = t4.difficulty_level) t5
    where t5.score_earned = t5.score_full
    group by t5.hacker_id) t6
left join Hackers t7
on t6.hacker_id = t7.hacker_id
where t6.num_full>1
order by t6.num_full desc, hacker_id asc
