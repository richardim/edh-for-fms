#
# tbl_panel
# taxpayerid,countrycode,year,timeperiod,logprivatecredit,inflation,logtrade,logschooling,
# growthingini,growthgdppercapita,loginitialgini,span,loginitialgdppercapita,
# growthlowestincomeshare,loginitiallowestincomeshare
#
create database IF NOT EXISTS finance_data_edh;
use finance_data_edh;
Create table IF NOT EXISTS finance_data_edh.tbl_panel
(
 taxpayerid String,
 countrycode String,
 year int,
 timeperiod int,
 logprivatecredit double,
 inflation double,
 logtrade double,
 logschooling double,
 growthingini double,
 growthgdppercapita double,
 loginitialgini double,
 span int,
 loginitialgdppercapita double,
 growthlowestincomeshare double,
 loginitiallowestincomeshare double
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
;

# load data
LOAD DATA INPATH '/user/cloudera/finance_data_edh/panel.csv' 
OVERWRITE INTO TABLE finance_data_edh.tbl_panel;

# validate load
select * from finance_data_edh.tbl_panel limit 10;
select count(*) from finance_data_edh.tbl_panel;