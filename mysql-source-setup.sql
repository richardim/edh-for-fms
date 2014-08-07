#
# creates user for sqoop - doesnt check for existence so only run if you need to
#
CREATE USER 'cdhsqooper'@'localhost' IDENTIFIED BY 'cdhsqooper';
GRANT ALL PRIVILEGES ON *.* TO 'cdhsqooper'@'localhost' WITH GRANT OPTION;
CREATE USER 'cdhsqooper'@'%' IDENTIFIED BY 'cdhsqooper';
GRANT ALL PRIVILEGES ON *.* TO 'cdhsqooper'@'%' WITH GRANT OPTION;

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
 name VARCHAR(128),
 taxpayerid VARCHAR(12),
 countrycode VARCHAR(5),
 country VARCHAR(128),
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
);

#
# load csv 8005 
# Ensure your path to file is correct local to the mysql instance
#
use finance_data_edh;
LOAD DATA LOCAL INFILE '/Users/rim/_cdh-demos/demo-for-treasury/data/8005.csv'
INTO TABLE finance_data_edh.tbl_8005
FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

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
 taxpayerid VARCHAR(12),
 countrycode VARCHAR(5),
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
);

#
# load csv 6005 
# Ensure your path to file is correct local to the mysql instance
#
use finance_data_edh;
LOAD DATA LOCAL INFILE '/Users/rim/_cdh-demos/demo-for-treasury/data/6005.csv'
INTO TABLE finance_data_edh.tbl_6005
FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

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
 taxpayerid VARCHAR(12),
 countrycode VARCHAR(5),
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
);

#
# load csv panel 
# Ensure your path to file is correct local to the mysql instance
#
use finance_data_edh;
LOAD DATA LOCAL INFILE '/Users/rim/_cdh-demos/demo-for-treasury/data/panel.csv'
INTO TABLE finance_data_edh.tbl_panel
FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

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
 name VARCHAR(128),
 taxpayerid VARCHAR(12),
 country VARCHAR(128),
 year int,
 logagedependency double,
 countrycode VARCHAR(5),
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
);

#
# load csv poverty 
# Ensure your path to file is correct local to the mysql instance
#
use finance_data_edh;
LOAD DATA LOCAL INFILE '/Users/rim/_cdh-demos/demo-for-treasury/data/poverty.csv'
INTO TABLE finance_data_edh.tbl_poverty
FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

#
# Create the final destination table for our combined
# transformation
#
use finance_data_edh;
Create table IF NOT EXISTS finance_data_edh.combined_export_table
(
 FullName VARCHAR(128),
 TIN VARCHAR(12),
 year int,
 TotalCount int, 
 Amount double,
 AgencyLocationCode double,
 RoutingNumber double,
 CountryCode VARCHAR(5), 
 Country VARCHAR(128),
 CheckSerialNumber double,
 FederalProgramAgencyIdentifier int,
 SwiftReportingDetail double, 
 ACH_Reporting float, 
 ACH_TraceNumber double,
 ACH_OriginalTraceNumber double, 
 EIN float, 
 ControlNumber float, 
 PhoneNumber double, 
 PaymentDetailTypeCode float, 
 CheckStubLine double, 
 CheckMemoLine float, 
 WirePayment float, 
 WireDetail float, 
 FedWireTypeCode float, 
 BankName float, 
 BeneficiaryIdentifier float, 
 PaymentRemark float, 
 BeneficiaryBankRemarks float
);