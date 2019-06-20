@AbapCatalog.sqlViewName: 'ZPRIOVH'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help for Priority'

@Search.searchable: true

@ObjectModel.semanticKey:  [ 'priority' ]
@ObjectModel.representativeKey: ['priority']
@VDM.viewType: #CONSUMPTION

@ObjectModel.resultSet.sizeCategory: #XS
@ObjectModel.dataCategory: #VALUE_HELP

define view Z_C_PriorityVH as select from Z_I_PurchaseDocumentPriority {
@ObjectModel.text.element: ['PriorityText']
key Priority,
@Search: { defaultSearchElement: true, ranking: #HIGH, fuzzinessThreshold: 0.7 }
    PriorityText
}
