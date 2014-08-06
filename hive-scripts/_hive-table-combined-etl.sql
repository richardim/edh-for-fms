#
# Mapped to fields from source to fms types where values are relatable:
# fms.FullName=b/d/.name
# fms.TIN=a/b/c/d/.taxpayerid
# fms.TotalCount=c.timeperiod
# fms.Amount=c.loginitialgini - edited values in source
# fms.AgencyLocationCode=c.loginitialgdppercapita - edited values in source
# fms.RoutingNumber=c.inflation - edited values in source
# fms.CountryCode=a.countrycode
# Others are just labels to match fms fields
#

CREATE table finance_data_edh.combined_etl_table AS
SELECT
COALESCE(b.name, d.name) as FullName,
COALESCE(a.taxpayerid, b.taxpayerid, c.taxpayerid, d.taxpayerid) as TIN,
c.year,
c.timeperiod as TotalCount,
c.loginitialgini as Amount,
c.loginitialgdppercapita as AgencyLocationCode,
c.inflation as RoutingNumber,
a.countrycode as CountryCode,
b.country as Country,
c.growthingini as CheckSerialNumber,
c.span as FederalProgramAgencyIdentifier,
c.growthgdppercapita as SwiftReportingDetail,
a.privcreavg as ACH_Reporting,
c.logprivatecredit as ACH_TraceNumber,
c.logtrade as ACH_OriginalTraceNumber,
a.gr_ltrade as EIN,
a.gr_school as ControlNumber,
c.logschooling as PhoneNumber,
a.logcommercialcentralbank as PaymentDetailTypeCode,
c.loginitiallowestincomeshare as CheckStubLine,
a.growthinlowestincomeshare as CheckMemoLine,
d.logagedependency as WirePayment,
d.loginitialheadcount as WireDetail,
d.loginitialpovertygap as FedWireTypeCode,
d.growthinheadcount as BankName,
d.growthinpovertygap as BeneficiaryIdentifier,
d.growthinmeanincome as PaymentRemark,
d.populationgrowth as BeneficiaryBankRemarks

FROM finance_data_edh.tbl_6005 A
LEFT OUTER JOIN

finance_data_edh.tbl_8005 B ON A.taxpayerid = B.taxpayerid
RIGHT OUTER JOIN

finance_data_edh.tbl_panel C ON A.taxpayerid = C.taxpayerid
LEFT OUTER JOIN

finance_data_edh.tbl_poverty D ON A.taxpayerid = D.taxpayerid
;



