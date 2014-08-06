#
# tbl_6005
# taxpayerid,countrycode,year,loginitialgini,growthingini,span,loginitialgdppercapita,
# growthgdppercapita,privcreavg,logprivatecredit,inflation,logtrade,gr_ltrade,gr_school,
# logschooling,logcommercialcentralbank,loginitiallowestincomeshare,
# growthinlowestincomeshare
#
create database IF NOT EXISTS finance_data_edh;
use finance_data_edh;
Create table IF NOT EXISTS finance_data_edh.tbl_6005
(
 taxpayerid String,
 countrycode String,
 year int,
 loginitialgini double,
 growthingini double,
 span int,
 loginitialgdppercapita double,
 growthgdppercapita double,
 privcreavg double,
 logprivatecredit double,
 inflation double,
 logtrade double,
 gr_ltrade double,
 gr_school double,
 logschooling double,
 logcommercialcentralbank double,
 loginitiallowestincomeshare double,
 growthinlowestincomeshare double						
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
;

# load data
LOAD DATA INPATH '/user/cloudera/finance_data_edh/6005.csv' 
OVERWRITE INTO TABLE finance_data_edh.tbl_6005;

# validate load
select * from finance_data_edh.tbl_6005 limit 10;
select count(*) from finance_data_edh.tbl_6005;