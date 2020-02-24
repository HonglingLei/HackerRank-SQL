select distinct CITY from STATION
where substring(CITY,1,1)="a"
or substring(CITY,1,1)="e"
or substring(CITY,1,1)="i"
or substring(CITY,1,1)="o"
or substring(CITY,1,1)="u"