@EndUserText.label: 'Order Item'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_ORDERITEMBO
  as projection on ZI_ORDERITEMBO
{

  key OrderID,
  key ItemNo,
      ProductID,
      Quantity,
      BaseUnit,
      UnitPrice,
      Currency,

      _Currency,
      _Header : redirected to parent ZC_ORDERBO,
      _Product,
      _Unit

}
