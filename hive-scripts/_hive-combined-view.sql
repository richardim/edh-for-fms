/* vw_auditor */
CREATE view finance_data_edh.vw_auditor AS
SELECT
Fullname,
Tin,
Year,
Totalcount,
Amount,
RoutingNumber,
Country,
CheckSerialNumber,
FederalProgramAgencyIdentifier,
AgencyLocationCode,
SwiftReportingDetail,
ACH_Reporting,
ACH_TraceNumber,
ACH_OriginalTraceNumber

FROM finance_data_edh.combined_etl_table

where year>1980
order by year
;

select * from vw_auditor where fullname !="" order by fullname, tin, year;

/* vw_inspector */
CREATE view finance_data_edh.vw_inspector AS
SELECT
CountryCode,
Country,
Year,
Totalcount,
Amount,
RoutingNumber,
CheckSerialNumber,
FederalProgramAgencyIdentifier,
AgencyLocationCode,
SwiftReportingDetail,
ACH_Reporting,
ACH_TraceNumber,
ACH_OriginalTraceNumber,
CheckMemoLine,
WirePayment,
WireDetail,
PaymentDetailTypeCode,
CheckStubLine

FROM finance_data_edh.combined_etl_table
;
