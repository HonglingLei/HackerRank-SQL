select S.Name from
    (select t2.ID, t2.Salary, t2.Friend_ID, t2.Friend_Salary from
        (select t1.ID, t1.Salary, t1.Friend_ID, P.Salary as Friend_Salary
        from
            (select F.ID, P.Salary, F.Friend_ID 
            from Friends F
            left join Packages P
            on F.ID = P.ID) t1
        left join Packages P
        on t1.Friend_ID = P.ID) t2
    where t2.Salary < t2.Friend_Salary) t3
left join Students S
on t3.ID = S.ID
order by Friend_Salary /*教训：order by应该在最外层，不要放中间。不然后面join时又会变顺序。*/