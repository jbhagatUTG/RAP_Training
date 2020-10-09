@AbapCatalog.sqlViewName: 'ZIPRODUCTCAT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product Category'

@ClientHandling.algorithm: #SESSION_VARIABLE
@Search.searchable: true
@VDM.viewType: #BASIC

define view ZI_ProductCategory
  as select from    dd07l as FixedValue
    left outer join dd07t as ValueText on  FixedValue.domname    = ValueText.domname
                                       and FixedValue.domvalue_l = ValueText.domvalue_l
                                       and FixedValue.as4local   = ValueText.as4local

{
      @EndUserText.label: 'Product Category'
      @ObjectModel.text.element: 'Text'
  key FixedValue.domvalue_l as Category,
      @Semantics.text: true
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      ValueText.ddtext      as Text
}

where
      FixedValue.as4local  = 'A' //Active
  and FixedValue.domname   = 'ZDCATEGORY'
  and ValueText.ddlanguage = $session.system_language
