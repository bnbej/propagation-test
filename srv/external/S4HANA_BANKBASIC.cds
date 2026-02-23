/* checksum : e5f575fd1f4aa21bc65e78ccf3074808 */
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
service S4HANA_BANKBASIC {
  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Housebank Searchhelp'
  @Capabilities.SearchRestrictions.Searchable : false
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  entity zjwtest_hbkid_f4 {
    @Common.IsUpperCase : true
    @Common.Label : 'Company Code'
    @Common.Heading : 'CoCd'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BUKRS'
    key bukrs : String(4) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'House Bank'
    @Common.Heading : 'House Bk'
    @Common.QuickInfo : 'Short Key for a House Bank'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=HBKID'
    key hbkid : String(5) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Bank Country/Region'
    @Common.Heading : 'C/R'
    @Common.QuickInfo : 'Bank Country/Region Key'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BANKS'
    banks : String(3) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Bank Key'
    @Common.QuickInfo : 'Bank Keys'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BANKK'
    bankl : String(15) not null;
    @Common.Label : 'Bank Name'
    @Common.Heading : 'Name of Financial Institution'
    @Common.QuickInfo : 'Name of Financial Institution'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BANKA'
    banka : String(60) not null;
    buser : String(12) not null;
  };
};

