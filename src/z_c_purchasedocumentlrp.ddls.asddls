@AbapCatalog.sqlViewName: 'ZCPURCHDOCLRP'
@EndUserText.label: 'Purchase Document'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@ObjectModel.representativeKey: 'PurchaseDocument'
@ObjectModel.semanticKey: [ 'PurchaseDocument' ]

@OData.publish: true

@Search.searchable: true


@Metadata.allowExtensions:true

@ObjectModel.transactionalProcessingDelegated: true
@ObjectModel.compositionRoot: true

@ObjectModel.createEnabled: true
@ObjectModel.updateEnabled: true
@ObjectModel.deleteEnabled: true

@VDM.viewType: #CONSUMPTION

define view Z_C_PurchaseDocumentLrp
  as select from Z_I_PurchaseDocumentTP
  association [0..*] to Z_C_PurchaseDocumentItemLrp as _PurchaseDocumentItem on $projection.PurchaseDocument = _PurchaseDocumentItem.PurchaseDocument
  association [0..1] to I_Indicator                 as _IsApprovalRequired   on $projection.IsApprovalRequired = _IsApprovalRequired.IndicatorValue

{

      @EndUserText.label: 'Purchase Document'
      @Consumption.semanticObject: 'PurchasingDocument'
  key PurchaseDocument,

      @EndUserText.label: 'Overall Price'
      OverallPrice,


      @EndUserText.label: 'Approval Required'
      @ObjectModel.foreignKey.association: '_IsApprovalRequired'
      @ObjectModel.readOnly: true
      case when OverallPrice > 1000 then 'X' else '' end                                    as IsApprovalRequired,



      // TODO: Example using TDD
      @ObjectModel.readOnly: true
      case when OverallPrice >= 0 and OverallPrice < 1000 then 3
        when OverallPrice >= 1000 and OverallPrice <= 10000 then 2
        when OverallPrice > 10000 then 1
        else 0 end                                                                          as OverallPriceCriticality,

      @EndUserText.label: 'Status'
      Status,

      @EndUserText.label: 'Priority'
      Priority,

      @Search.defaultSearchElement : true
      @Search.fuzzinessThreshold : 0.8
      @Semantics.text: true
      @EndUserText.label: 'Description'
      Description,

      @EndUserText.label: 'Purchasing Organization'
      PurchasingOrganization,

      @EndUserText.label: 'Currency'
      Currency,

      // BOPF Admin Data
      @EndUserText.label: 'Created at'
      @Consumption.filter.hidden: true
      crea_date_time,
      @EndUserText.label: 'Created by'
      crea_uname,
      @EndUserText.label: 'Last changed at'
      @Consumption.filter.hidden: true
      lchg_date_time,
      @EndUserText.label: 'Last changed by'
      lchg_uname,


      @EndUserText.label: 'Image'
      @Consumption.filter.hidden: true
      PurchaseDocumentImageURL,


      /* Associations */
      @ObjectModel.association.type: #TO_COMPOSITION_CHILD
      _PurchaseDocumentItem,
      
      _Currency,
      _IsApprovalRequired,
      _Priority,
      
      _Status,
      _PurchasingOrganization
}
