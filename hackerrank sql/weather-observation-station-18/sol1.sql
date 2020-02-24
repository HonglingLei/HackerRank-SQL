select round(abs(t1.a-t1.c)+abs(t1.b-t1.d),4) from
    (select 
    min(LAT_N) as a,
    min(LONG_W) as b,
    max(LAT_N) as c,
    max(LONG_W) as d
    from STATION) t1