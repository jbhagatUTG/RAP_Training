@EndUserText.label: 'Order Header'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_ORDERBO
  as projection on ZI_ORDERBO
{

  key OrderID,
      CompanyCode,
      OrderStatus,
//      OrderTotal,       //This was supposed to be virtual element, but its not due to technical error

      _CompanyCode,
      _Item : redirected to composition child ZC_ORDERITEMBO,
      _Status

}
