@AbapCatalog.sqlViewName: 'ZIPRODUCTVH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product Value Help'

@VDM.viewType: #COMPOSITE
@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'ProductID'

@ObjectModel.usageType.serviceQuality: #B
@ObjectModel.usageType.sizeCategory: #L
@ObjectModel.usageType.dataClass: #MASTER

@ClientHandling.algorithm: #SESSION_VARIABLE
@Search.searchable: true

define view ZI_ProductVH
  as select from ZI_Product
  association [0..1] to ZI_ProductCategory as _Category on $projection.Category = _Category.Category
{
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.9
      @Search.ranking: #HIGH
      @ObjectModel.text.element: ['ProductDescription']
  key ProductID,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.85
      @Search.ranking: #MEDIUM
      @Semantics.text: true
      _Description[1:Language = $session.system_language ].ProductDescription,
      @ObjectModel.foreignKey.association: '_Category'
      Category,
      @Semantics.amount.currencyCode: 'Currency'
      UnitPrice,
      @UI.hidden: true
      @Semantics.currencyCode: true
      Currency,

      _Category
}
