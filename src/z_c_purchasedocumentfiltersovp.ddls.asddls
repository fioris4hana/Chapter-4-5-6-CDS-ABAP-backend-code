@AbapCatalog.sqlViewName: 'ZCPRCHDOCFILTERS'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Filters for Purchasing Document OVP'

@VDM.viewType: #CONSUMPTION
define view Z_C_PURCHASEDOCUMENTFILTERSOVP
  as select from Z_I_PurchaseDocument
{

      @Consumption.filter.hidden: true
  key PurchaseDocument,
      @UI: {
          selectionField: { exclude: false, position: 10 }
        }
      @Consumption: {
        valueHelpDefinition: [{ entity: { name: 'Z_C_PriorityVH', element: 'Priority'  }}]
        }
      cast('' as abap.char(1)) as Priority,
      @UI: {
         selectionField: { exclude: false, position: 20 }
       }
      @Consumption: {
        valueHelpDefinition: [{ entity: { name: 'Z_C_StatusVH', element: 'Status'  }}]
        }
      cast('' as abap.char(1)) as Status

}
