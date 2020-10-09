@AbapCatalog.sqlViewName: 'ZIORDERSTATUS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Order Status'

@ClientHandling.algorithm: #SESSION_VARIABLE
@Search.searchable: true
@VDM.viewType: #BASIC

define view ZI_OrderStatus
  as select from    dd07l as FixedValue
    left outer join dd07t as ValueText on  FixedValue.domname    = ValueText.domname
                                       and FixedValue.domvalue_l = ValueText.domvalue_l
                                       and FixedValue.as4local   = ValueText.as4local

{
      @EndUserText.label: 'Order Status'
      @ObjectModel.text.element: 'Text'
  key FixedValue.domvalue_l as Status,
      @Semantics.text: true
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      ValueText.ddtext      as Text
}

where
      FixedValue.as4local  = 'A' //Active
  and FixedValue.domname   = 'ZDSTATUS'
  and ValueText.ddlanguage = $session.system_language
