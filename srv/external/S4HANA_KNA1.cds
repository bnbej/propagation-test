/* checksum : 65b992d449416b966cd99adb0dbdffeb */
@cds.external : true
@Common.ApplyMultiUnitBehaviorForSortingAndFiltering : true
@Capabilities.FilterFunctions : [
  'eq',
  'ne',
  'gt',
  'ge',
  'lt',
  'le',
  'and',
  'or',
  'contains',
  'startswith',
  'endswith',
  'any',
  'all'
]
@SAP__support.TechnicalInfoLinks.Url : '../../../../default/iwbep/common/0001/$metadata'
@SAP__support.TechnicalInfoLinks.FunctionImport : 'GetTechnicalInfoLinks'
@Capabilities.SupportedFormats : [ 'application/json', 'application/pdf' ]
@PDF.Features.DocumentDescriptionReference : '../../../../default/iwbep/common/0001/$metadata'
@PDF.Features.DocumentDescriptionCollection : 'MyDocumentDescriptions'
@PDF.Features.ArchiveFormat : true
@PDF.Features.Border : true
@PDF.Features.CoverPage : true
@PDF.Features.FitToPage : true
@PDF.Features.FontName : true
@PDF.Features.FontSize : true
@PDF.Features.HeaderFooter : true
@PDF.Features.IANATimezoneFormat : true
@PDF.Features.Margin : true
@PDF.Features.Padding : true
@PDF.Features.ResultSizeDefault : 20000
@PDF.Features.ResultSizeMaximum : 20000
@PDF.Features.Signature : true
@PDF.Features.TextDirectionLayout : true
@PDF.Features.Treeview : true
@PDF.Features.UploadToFileShare : true
@Capabilities.KeyAsSegmentSupported : true
@Capabilities.AsynchronousRequestsSupported : true
service S4HANA_KNA1 {
  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'i_customer'
  @Capabilities.SearchRestrictions.Searchable : false
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  entity zjwtest_kna1 {
    @Common.IsUpperCase : true
    @Common.Label : 'Customer'
    @Common.QuickInfo : 'Customer Number'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KUNNR'
    key kunnr : String(10) not null;
    @Common.Label : 'Name of Customer'
    @Common.Heading : 'Customer'
    name1 : String(80) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Customer Name'
    @Common.QuickInfo : 'Customer Full Name'
    CustomerFullName : String(220) not null;
    @Common.Label : 'Name of Customer'
    @Common.Heading : 'Customer'
    @Common.QuickInfo : 'Customer Name'
    BPCustomerName : String(81) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Customer Name'
    @Common.QuickInfo : 'Customer Full Name'
    BPCustomerFullName : String(220) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Created by'
    @Common.QuickInfo : 'Name of Person who Created the Object'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=ERNAM_RF'
    CreatedByUser : String(12) not null;
    @Common.Label : 'Created On'
    @Common.Heading : 'Date'
    @Common.QuickInfo : 'Record Created On'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=ERDAT_RF'
    CreationDate : Date;
    @Common.IsUpperCase : true
    @Common.Label : 'Address'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=ADRNR'
    AddressID : String(10) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Customer Classific.'
    @Common.Heading : 'Cl'
    @Common.QuickInfo : 'Customer Classification'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KUKLA'
    CustomerClassification : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'VAT Registration No.'
    @Common.QuickInfo : 'VAT Registration Number'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=STCEG'
    VATRegistration : String(20) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Account Group'
    @Common.Heading : 'Group'
    @Common.QuickInfo : 'Customer Account Group'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KTOKD'
    CustomerAccountGroup : String(4) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Authorization'
    @Common.Heading : 'AuGr'
    @Common.QuickInfo : 'Authorization Group'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BRGRU'
    AuthorizationGroup : String(4) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Delivery block'
    @Common.Heading : 'DlvBl'
    @Common.QuickInfo : 'Central delivery block for the customer'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=LIFSD_X'
    DeliveryIsBlocked : String(2) not null;
    @Common.Label : 'Posting Block'
    @Common.Heading : 'B'
    @Common.QuickInfo : 'Central Posting Block'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=SPERB_X'
    PostingIsBlocked : Boolean not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Billing Block'
    @Common.Heading : 'BlBlk'
    @Common.QuickInfo : 'Central billing block for customer'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=FAKSD_X'
    BillingIsBlockedForCustomer : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Order Block'
    @Common.Heading : 'OrBlk'
    @Common.QuickInfo : 'Central order block for customer'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AUFSD_X'
    OrderIsBlockedForCustomer : String(2) not null;
    @Common.IsDigitSequence : true
    @Common.Label : 'Int. location no. 1'
    @Common.Heading : 'ILN 1'
    @Common.QuickInfo : 'International location number  (part 1)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BBBNR'
    InternationalLocationNumber1 : String(7) not null;
    @Common.Label : 'One-Time Account'
    @Common.QuickInfo : 'Indicator: Is the Account a One-Time Account?'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=XCPDK'
    IsOneTimeAccount : Boolean not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Tax Jurisdiction'
    @Common.Heading : 'Tax Jur.'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=TXJCD'
    TaxJurisdiction : String(15) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Industry'
    @Common.Heading : 'Indust.'
    @Common.QuickInfo : 'Industry Key'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BRSCH'
    Industry : String(4) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Tax Number Type'
    @Common.Heading : 'Tax no.ty.'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=J_1ATOID'
    TaxNumberType : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Tax Number 1'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=STCD1'
    TaxNumber1 : String(16) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Tax Number 2'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=STCD2'
    TaxNumber2 : String(11) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Tax Number 3'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=STCD3'
    TaxNumber3 : String(18) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Tax Number 4'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=STCD4'
    TaxNumber4 : String(18) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Tax Number 5'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=STCD5'
    TaxNumber5 : String(60) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Tax Number 6'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=STCD6'
    TaxNumber6 : String(20) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Group Key'
    @Common.Heading : 'Group'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KONZS'
    CustomerCorporateGroup : String(10) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Supplier'
    @Common.QuickInfo : 'Account Number of Supplier'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=LIFNR'
    Supplier : String(10) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Nielsen Indicator'
    @Common.Heading : 'NS'
    @Common.QuickInfo : 'Nielsen ID'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=NIELS'
    NielsenRegion : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Industry Code 1'
    @Common.Heading : 'Ind.Code 1'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BRAN1_D'
    IndustryCode1 : String(10) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Industry Code 2'
    @Common.Heading : 'Ind.code 2'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BRAN2'
    IndustryCode2 : String(10) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Industry Code 3'
    @Common.Heading : 'Ind.code 3'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BRAN3'
    IndustryCode3 : String(10) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Industry Code 4'
    @Common.Heading : 'Ind.code 4'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BRAN4'
    IndustryCode4 : String(10) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Industry Code 5'
    @Common.Heading : 'Ind.code 5'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BRAN5'
    IndustryCode5 : String(10) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Country/Region Key'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=LAND1_GP'
    Country : String(3) not null;
    @Common.Label : 'Name'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=NAME1_GP'
    OrganizationBPName1 : String(35) not null;
    @Common.Label : 'Name 2'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=NAME2_GP'
    OrganizationBPName2 : String(35) not null;
    @Common.Label : 'City'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=ORT01_GP'
    CityName : String(35) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Postal Code'
    @Common.Heading : 'PostalCode'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=PSTLZ'
    PostalCode : String(10) not null;
    @Common.Label : 'Street'
    @Common.QuickInfo : 'Street and House Number'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=STRAS_GP'
    StreetName : String(35) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Search Term'
    @Common.Heading : 'SearchTerm'
    @Common.QuickInfo : 'Sort Field'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=SORTL'
    SortField : String(10) not null;
    @Common.Label : 'Fax Number'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=TELFX'
    FaxNumber : String(31) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Suframa Code'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=J_1BSUFRAMA'
    BR_SUFRAMACode : String(9) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Region'
    @Common.Heading : 'Rg'
    @Common.QuickInfo : 'Region (State, Province, County)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=REGIO'
    Region : String(3) not null;
    @Common.Label : 'Telephone 1'
    @Common.QuickInfo : 'First telephone number'
    TelephoneNumber1 : String(16) not null;
    @Common.Label : 'Telephone 2'
    @Common.QuickInfo : 'Second telephone number'
    TelephoneNumber2 : String(16) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Alternative Payer'
    @Common.Heading : 'Alt. Payer'
    @Common.QuickInfo : 'Account Number of an Alternative Payer'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KNRZA'
    AlternativePayerAccount : String(10) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'DME Recipient Code'
    @Common.Heading : 'R'
    @Common.QuickInfo : 'Recipient Code for Data Medium Exchange'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=DTAMS'
    DataMediumExchangeIndicator : String(1) not null;
    @Common.Label : 'Liable for VAT'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=STKZU'
    VATLiability : Boolean not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Purpose Completed'
    @Common.Heading : 'Business Purpose Completed Flag'
    @Common.QuickInfo : 'Business Purpose Completed Flag'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=CVP_XBLCK'
    IsBusinessPurposeCompleted : String(1) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Tax Type'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=J_1AFITP_D'
    ResponsibleType : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Fiscal address'
    @Common.Heading : 'Fisc.addr.'
    @Common.QuickInfo : 'Account number of the master record with the fiscal address'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=FISKN_D'
    FiscalAddress : String(10) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Natural Person'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=STKZN'
    NFPartnerIsNaturalPerson : String(1) not null;
    @Common.Label : 'Deletion Flag'
    @Common.Heading : 'DelF'
    @Common.QuickInfo : 'Central Deletion Flag for Master Record'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=LOEVM_X'
    DeletionIndicator : Boolean not null;
    @Common.Label : 'Language Key'
    @Common.Heading : 'Language'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=SPRAS'
    Language : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Trading Partner No.'
    @Common.Heading : 'Tr.Prt'
    @Common.QuickInfo : 'Company ID of Trading Partner'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=RASSC'
    TradingPartner : String(6) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Deliv Date Rule'
    @Common.Heading : 'DlvDteRule'
    @Common.QuickInfo : 'Delivery Date Rule'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=SD_DELIVERY_DATE_TYPE_RULE'
    DeliveryDateTypeRule : String(1) not null;
    @Common.Label : 'Express station'
    @Common.QuickInfo : 'Express train station'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BAHNE'
    ExpressTrainStationName : String(25) not null;
    @Common.Label : 'Train station'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BAHNS'
    TrainStationName : String(25) not null;
    @Common.IsDigitSequence : true
    @Common.Label : 'Int. location no. 2'
    @Common.Heading : 'ILN 2'
    @Common.QuickInfo : 'International location number (Part 2)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BBSNR'
    InternationalLocationNumber2 : String(5) not null;
    @Common.IsDigitSequence : true
    @Common.Label : 'Check digit'
    @Common.QuickInfo : 'Check digit for the international location number'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BUBKZ'
    InternationalLocationNumber3 : String(1) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'City Code'
    @Common.Heading : 'Code'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=CITYC'
    CityCode : String(4) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'County Code'
    @Common.Heading : 'CCd'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=COUNC'
    County : String(3) not null;
    @Common.Label : 'Unloading points'
    @Common.Heading : 'UnlPt'
    @Common.QuickInfo : 'Indicator: Unloading points exist'
    CustomerHasUnloadingPoint : Boolean not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Working times'
    @Common.Heading : 'Working time calendar'
    @Common.QuickInfo : 'Working Time Calendar'
    CustomerWorkingTimeCalendar : String(2) not null;
    @Common.Label : 'Competitors'
    @Common.Heading : 'C'
    @Common.QuickInfo : 'Indicator: Competitor'
    IsCompetitor : Boolean not null;
    @Common.Label : 'Rep''s Name'
    @Common.Heading : 'Name of Representative'
    @Common.QuickInfo : 'Name of Representative'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=REPRES'
    TaxInvoiceRepresentativeName : String(10) not null;
    @Common.Label : 'Type of Business'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=GESTYP'
    BusinessType : String(30) not null;
    @Common.Label : 'Type of Industry'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=INDTYP'
    IndustryType : String(30) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Consolidated Invoic.'
    @Common.Heading : 'Consolidated Invoicing for Taiwan'
    @Common.QuickInfo : 'Consolidated Invoicing for Taiwan'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=TWGUI_CONSOLIDATE_INVOICE'
    TW_CollvBillingIsSupported : String(1) not null;
    @Common.Label : 'Alt.payer in doc?'
    @Common.QuickInfo : 'Indicator: Is an alternative payer allowed in document?'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=XREGU'
    AlternativePayeeIsAllowed : Boolean not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Attribute 1'
    @Common.Heading : 'A1'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KATR1'
    FreeDefinedAttribute01 : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Attribute 2'
    @Common.Heading : 'A2'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KATR2'
    FreeDefinedAttribute02 : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Attribute 3'
    @Common.Heading : 'A3'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KATR3'
    FreeDefinedAttribute03 : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Attribute 4'
    @Common.Heading : 'A4'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KATR4'
    FreeDefinedAttribute04 : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Attribute 5'
    @Common.Heading : 'A5'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KATR5'
    FreeDefinedAttribute05 : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Attribute 6'
    @Common.Heading : 'A6'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KATR6'
    FreeDefinedAttribute06 : String(3) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Attribute 7'
    @Common.Heading : 'A7'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KATR7'
    FreeDefinedAttribute07 : String(3) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Attribute 8'
    @Common.Heading : 'A8'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KATR8'
    FreeDefinedAttribute08 : String(3) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Attribute 9'
    @Common.Heading : 'A9'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KATR9'
    FreeDefinedAttribute09 : String(3) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Attribute 10'
    @Common.Heading : 'A10'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KATR10'
    FreeDefinedAttribute10 : String(3) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Payment Reason'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=FARP_PAYT_RSN'
    PaymentReason : String(4) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Condition Group 1'
    @Common.Heading : 'CGr1'
    @Common.QuickInfo : 'Customer Condition Group 1'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KDKG1'
    CustomerConditionGroup1 : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Condition Group 2'
    @Common.Heading : 'CGr2'
    @Common.QuickInfo : 'Customer Condition Group 2'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KDKG2'
    CustomerConditionGroup2 : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Condition Group 3'
    @Common.Heading : 'CGr3'
    @Common.QuickInfo : 'Customer Condition Group 3'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KDKG3'
    CustomerConditionGroup3 : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Condition Group 4'
    @Common.Heading : 'CGr4'
    @Common.QuickInfo : 'Customer Condition Group 4'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KDKG4'
    CustomerConditionGroup4 : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Condition Group 5'
    @Common.Heading : 'CGr5'
    @Common.QuickInfo : 'Customer Condition Group 5'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KDKG5'
    CustomerConditionGroup5 : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Prospect'
    @Common.Heading : 'I'
    @Common.QuickInfo : 'Indicator: Sales prospect'
    IsSalesProspect : String(1) not null;
    @Common.Label : 'Payment block'
    @Common.QuickInfo : 'Payment Block'
    PaymentIsBlockedForCustomer : Boolean not null;
    @Common.Label : 'Consumer'
    @Common.QuickInfo : 'Indicator: Consumer'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=DEAR6'
    IsConsumer : Boolean not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Data Ctrlr. Set'
    @Common.Heading : 'Data Controller Set Flag'
    @Common.QuickInfo : 'BP: Data Controller Set Flag'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BU_XDCSET'
    DataControllerSet : String(1) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Data Controller'
    @Common.QuickInfo : 'BP: Data Controller (Internal Use Only)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BU_DATA_CONTROLLER'
    DataController1 : String(30) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Data Controller'
    @Common.QuickInfo : 'BP: Data Controller (Internal Use Only)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BU_DATA_CONTROLLER'
    DataController2 : String(30) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Data Controller'
    @Common.QuickInfo : 'BP: Data Controller (Internal Use Only)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BU_DATA_CONTROLLER'
    DataController3 : String(30) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Data Controller'
    @Common.QuickInfo : 'BP: Data Controller (Internal Use Only)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BU_DATA_CONTROLLER'
    DataController4 : String(30) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Data Controller'
    @Common.QuickInfo : 'BP: Data Controller (Internal Use Only)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BU_DATA_CONTROLLER'
    DataController5 : String(30) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Data Controller'
    @Common.QuickInfo : 'BP: Data Controller (Internal Use Only)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BU_DATA_CONTROLLER'
    DataController6 : String(30) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Data Controller'
    @Common.QuickInfo : 'BP: Data Controller (Internal Use Only)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BU_DATA_CONTROLLER'
    DataController7 : String(30) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Data Controller'
    @Common.QuickInfo : 'BP: Data Controller (Internal Use Only)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BU_DATA_CONTROLLER'
    DataController8 : String(30) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Data Controller'
    @Common.QuickInfo : 'BP: Data Controller (Internal Use Only)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BU_DATA_CONTROLLER'
    DataController9 : String(30) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Data Controller'
    @Common.QuickInfo : 'BP: Data Controller (Internal Use Only)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BU_DATA_CONTROLLER'
    DataController10 : String(30) not null;
    @Common.Label : 'Name'
    @Common.QuickInfo : 'Name 1'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_NAME1'
    BusinessPartnerName1 : String(40) not null;
    @Common.Label : 'Name 2'
    BusinessPartnerName2 : String(40) not null;
    @Common.Label : 'Name 3'
    BusinessPartnerName3 : String(40) not null;
    @Common.Label : 'Name 4'
    BusinessPartnerName4 : String(40) not null;
    @Common.Label : 'City'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_CITY1'
    BPAddrCityName : String(40) not null;
    @Common.Label : 'Street'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_STREET'
    BPAddrStreetName : String(60) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Search Term 1'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_SORT1'
    AddressSearchTerm1 : String(20) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Search Term 2'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_SORT2'
    AddressSearchTerm2 : String(20) not null;
    @Common.Label : 'District'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_CITY2'
    DistrictName : String(40) not null;
    @Common.Label : 'PO Box City'
    @Common.QuickInfo : 'PO Box city'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_POBXLOC'
    POBoxDeviatingCityName : String(40) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Title Key'
    @Common.Heading : 'Key'
    @Common.QuickInfo : 'Form-of-Address Key'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_TITLE'
    BusinessPartnerFormOfAddress : String(4) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'ICMS Taxpayer'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=J_1BICMSTAXPAY'
    BR_ICMSTaxPayerType : String(2) not null;
  };
};

