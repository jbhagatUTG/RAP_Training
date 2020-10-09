@AbapCatalog.sqlViewName: 'ZIORDER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Order'
@VDM.viewType: #BASIC
define view ZI_Order
  as select from zrap_order
{

  key order_id as OrderID,
      bukrs    as CompanyCode,
      status   as OrderStatus
}
