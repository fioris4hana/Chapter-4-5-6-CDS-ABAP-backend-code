@AbapCatalog.sqlViewName: 'ZIPURCHDOCTP'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'PurchaseDocument'


@ObjectModel.modelCategory: #BUSINESS_OBJECT
@ObjectModel.compositionRoot: true
@ObjectModel.transactionalProcessingEnabled: true
@ObjectModel.writeActivePersistence: 'ZPURCHDOCUMENT'

@ObjectModel.createEnabled: true
@ObjectModel.deleteEnabled: true
@ObjectModel.updateEnabled: true

@VDM.viewType: #COMPOSITE

@OData.publish: true

define view Z_I_PurchaseDocumentTP
  as select from Z_I_PurchDocOverallPrice
  association [0..*] to Z_I_PurchaseDocumentItemTP as _PurchaseDocumentItem on $projection.PurchaseDocument = _PurchaseDocumentItem.PurchaseDocument
{

  key PurchaseDocument,
      Description,
      @ObjectModel.readOnly: true
      Status,
      Priority,

      @ObjectModel.readOnly: true
      OverallPrice,
      @ObjectModel.readOnly: true
      Currency,

      PurchasingOrganization,
      PurchaseDocumentImageURL,

      // BOPF Admin Data
      @ObjectModel.readOnly: true
      crea_date_time,
      @ObjectModel.readOnly: true
      crea_uname,
      @ObjectModel.readOnly: true
      lchg_date_time,
      @ObjectModel.readOnly: true
      lchg_uname,

      /* Associations */
      @ObjectModel.association.type: #TO_COMPOSITION_CHILD
      _PurchaseDocumentItem,
      _Currency,
      _Priority,
      _Status,
      _PurchasingOrganization

}
