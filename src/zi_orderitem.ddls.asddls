@AbapCatalog.sqlViewName: 'ZIORDERITEM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Order Item'
@VDM.viewType: #BASIC
define view ZI_OrderItem
  as select from zrap_orderitem
{

  key order_id   as OrderID,
  key item_no    as ItemNo,
      product_id as ProductID,
      quantity   as Quantity
}
