#
# tbl_poverty
# name,taxpayerid,country,year,logagedependency,countrycode,loginitialheadcount,
# loginitialpovertygap,growthinheadcount,growthinpovertygap,timespan,loginitialgini,
# growthinmeanincome,growthingdppercapita,logprivatecredit,logcommercialcentralbank,
# inflation,populationgrowth,logtrade,logschooling
#
create database IF NOT EXISTS finance_data_edh;
use finance_data_edh;
Create table IF NOT EXISTS finance_data_edh.tbl_poverty
(
 name String,
 taxpayerid String,
 country String,
 year int,
 logagedependency double,
 countrycode String,
 loginitialheadcount double,
 loginitialpovertygap double,
 growthinheadcount double,
 growthinpovertygap double,
 timespan int,
 loginitialgini double,
 growthinmeanincome double,
 growthingdppercapita double,
 logprivatecredit double,
 logcommercialcentralbank double,
 inflation double,
 populationgrowth double,
 logtrade double,
 logschooling double
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
;

# load data
LOAD DATA INPATH '/user/cloudera/finance_data_edh/poverty.csv' 
OVERWRITE INTO TABLE finance_data_edh.tbl_poverty;

# validate load
select * from finance_data_edh.tbl_poverty limit 10;
select count(*) from finance_data_edh.tbl_poverty;