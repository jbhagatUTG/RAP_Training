@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Order Item'
@AbapCatalog.sqlViewName: 'ZIORDERITEMBO'
@AbapCatalog.preserveKey: true

@ClientHandling.algorithm: #SESSION_VARIABLE
@VDM.viewType: #COMPOSITE

@ObjectModel.usageType: {
  serviceQuality: #C,
  sizeCategory: #L,
  dataClass: #TRANSACTIONAL
}

define view ZI_ORDERITEMBO
  as select from ZI_OrderItem
  association        to parent ZI_ORDERBO as _Header   on $projection.OrderID = _Header.OrderID
  association [0..1] to ZI_Product        as _Product  on $projection.ProductID = _Product.ProductID
  association [0..1] to I_UnitOfMeasure   as _Unit     on $projection.baseunit = _Unit.UnitOfMeasure
  association [0..1] to I_Currency        as _Currency on $projection.currency = _Currency.Currency
{

  key OrderID,
  key ItemNo,
      @ObjectModel.foreignKey.association: '_Product'
      ProductID,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      Quantity,
      @ObjectModel.foreignKey.association: '_Unit'
      @Semantics.unitOfMeasure: true
      _Product.BaseUnit,
      @Semantics.amount.currencyCode: 'Currency'
      _Product.UnitPrice,
      @ObjectModel.foreignKey.association: '_Currency'
      @Semantics.currencyCode: true
      _Product.Currency,

      _Header,
      _Product,
      _Unit,
      _Currency
}
