@AbapCatalog.sqlViewName: 'ZIPURCHDOCPRIO'
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Purchase Document Priority'
@ObjectModel.representativeKey: 'Priority'
@ObjectModel.semanticKey: ['Priority']
@Analytics.dataCategory: #DIMENSION
@VDM.viewType: #BASIC
@ObjectModel.resultSet.sizeCategory: #XS

define view Z_I_PurchaseDocumentPriority
  as select from zpurchdocprio
{

      @ObjectModel.text.element: ['PriorityText']
      @EndUserText.label: 'Priority'
  key priority     as Priority,

      @Semantics.text: true
      @EndUserText.label: 'Priority Text'
      prioritytext as PriorityText
}
