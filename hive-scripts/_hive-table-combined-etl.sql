CREATE table finance_data_edh.combined_etl_table AS
SELECT
COALESCE(b.name, d.name) as name,
COALESCE(a.taxpayerid, b.taxpayerid, c.taxpayerid, d.taxpayerid) as taxpayerid,
a.countrycode, 
b.country, 
c.year, 
c.timeperiod, 
c.loginitialgini, 
c.growthingini,
c.span,
c.loginitialgdppercapita,

c.growthgdppercapita, 
a.privcreavg, 
c.logprivatecredit, 
c.inflation, 
c.logtrade, 
a.gr_ltrade, 
a.gr_school, 
c.logschooling,
a.logcommercialcentralbank, 
c.loginitiallowestincomeshare,
a.growthinlowestincomeshare, 
d.logagedependency, 
d.loginitialheadcount,

d.loginitialpovertygap,
d.growthinheadcount,
d.growthinpovertygap,
d.growthinmeanincome,
d.populationgrowth

FROM finance_data_edh.tbl_6005 A 
LEFT OUTER JOIN

finance_data_edh.tbl_8005 B ON A.taxpayerid = B.taxpayerid 
RIGHT OUTER JOIN

finance_data_edh.tbl_panel C ON A.taxpayerid = C.taxpayerid 
LEFT OUTER JOIN

finance_data_edh.tbl_poverty D ON A.taxpayerid = D.taxpayerid
;

# after transform test query
use finance_data_edh;
select countrycode, country, 
CASE WHEN YEAR < 1990 then YEAR ELSE 0 END AS theYEAR, 
populationgrowth, growthinpovertygap
FROM combined_etl_table;