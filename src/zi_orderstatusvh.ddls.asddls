@AbapCatalog.sqlViewName: 'ZIORDERSTATUSVH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Order Status Value Help'

@VDM.viewType: #COMPOSITE
@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'Status'

@ObjectModel.usageType.serviceQuality: #B
@ObjectModel.usageType.sizeCategory: #L
@ObjectModel.usageType.dataClass: #MASTER

@ClientHandling.algorithm: #SESSION_VARIABLE
@Search.searchable: true
define view ZI_OrderStatusVH
  as select from ZI_OrderStatus
{

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.9
      @Search.ranking: #HIGH
      @ObjectModel.text.element: ['Text']
  key Status,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.85
      @Search.ranking: #MEDIUM
      @Semantics.text: true
      Text
}
