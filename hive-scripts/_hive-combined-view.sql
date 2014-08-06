CREATE view finance_data_edh.vw_auditor AS
SELECT
name,
taxpayerid, 
country, 
year, 
timeperiod, 
loginitialgini, 
growthingini,
span,
loginitialgdppercapita,
growthgdppercapita, 
privcreavg, 
logprivatecredit, 
inflation, 
logtrade

FROM finance_data_edh.combined_etl_table

where year>1980
order by year
;

select * from vw_auditor where name !="" order by name, taxpayerid, year ;

/* vw_inspector */
CREATE view finance_data_edh.vw_inspector AS
SELECT
countrycode, 
country, 
year, 
timeperiod, 
loginitialgini, 
growthingini,
span,
loginitialgdppercapita,

growthgdppercapita, 
privcreavg, 
logprivatecredit, 
inflation, 
logtrade,  
logschooling,
logcommercialcentralbank, 
loginitiallowestincomeshare,
growthinlowestincomeshare, 
logagedependency, 
loginitialheadcount

FROM finance_data_edh.combined_etl_table
;
