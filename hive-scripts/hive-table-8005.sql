#
# tbl_8005
# name,taxpayerid,countrycode,country,year,loginitialgini,growthingini,span,
# logprivatecredit,inflation,logtrade,logschooling,logcommercialcentralbank,
# loginitiallowestincomeshare,growthinlowestincomeshare
#
create database IF NOT EXISTS finance_data_edh;
use finance_data_edh;
Create table IF NOT EXISTS finance_data_edh.tbl_8005
(
 name String,
 taxpayerid String,
 countrycode String,
 country String,
 year int,
 loginitialgini double,
 growthingini double,
 span int,
 logprivatecredit double,
 inflation double,
 logtrade double,
 logschooling double,
 logcommercialcentralbank double,
 loginitiallowestincomeshare double,
 growthinlowestincomeshare double
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
;

# load data
LOAD DATA INPATH '/user/cloudera/finance_data_edh/8005.csv' 
OVERWRITE INTO TABLE finance_data_edh.tbl_8005;

# validate load
select * from finance_data_edh.tbl_8005 limit 10;
select count(*) from finance_data_edh.tbl_8005;