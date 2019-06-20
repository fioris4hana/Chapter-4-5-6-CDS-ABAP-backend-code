@AbapCatalog.sqlViewName: 'ZIPURCHORGA'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchasing Organization'
@Analytics.dataCategory: #DIMENSION
@VDM.viewType: #BASIC

@ObjectModel.semanticKey: ['PurchasingOrganization']
@ObjectModel.representativeKey: 'PurchasingOrganization'

define view Z_I_PurchasingOrganization
  as select from zpurchorg
{

      @ObjectModel.text.element: [ 'Description' ]
  key purchasingorganization as PurchasingOrganization,

      @Semantics.text: true
      @Semantics.name.fullName: true
      description            as Description,

      @Semantics: {
      eMail.address: true,
      eMail.type:  [ #WORK ]
      }
      emailaddress           as Email,
      @Semantics.telephone.type:  [ #WORK ]
      phonenumber            as Phone,
      @Semantics.telephone.type:  [ #FAX ]
      faxnumber              as Fax



}
