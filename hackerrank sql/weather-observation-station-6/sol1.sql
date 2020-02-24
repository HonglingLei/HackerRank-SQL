select distinct CITY from STATION
where substring(CITY,1,1) in ("A","E","I","O","U")