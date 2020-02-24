select round(sqrt((a-b)*(a-b)+(c-d)*(c-d)),4) from
    (select 
    min(LAT_N) as a,
    max(LAT_N) as b,
    min(LONG_W) as c,
    max(LONG_W) as d 
    from STATION)t1