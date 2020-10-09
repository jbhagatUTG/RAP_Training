@AbapCatalog.sqlViewName: 'ZIORDERBO'
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Order Header'

@ClientHandling.algorithm: #SESSION_VARIABLE
@VDM.viewType: #COMPOSITE

@ObjectModel.usageType: {
  serviceQuality: #C,
  sizeCategory: #L,
  dataClass: #TRANSACTIONAL
}

define root view ZI_ORDERBO
  as select from ZI_Order
  composition [0..*] of ZI_ORDERITEMBO as _Item
  association [0..1] to I_CompanyCode  as _CompanyCode on $projection.CompanyCode = _CompanyCode.CompanyCode
  association [0..1] to ZI_OrderStatus as _Status      on $projection.OrderStatus = _Status.Status
{

  key OrderID,
      @ObjectModel.foreignKey.association: '_CompanyCode'
      CompanyCode,
      @ObjectModel.foreignKey.association: '_Status'
      OrderStatus,

//      @ObjectModel.readOnly: true
//      @ObjectModel.virtualElement: true                                               //Technical error:  short dump in H4S
//      @ObjectModel.virtualElementCalculatedBy: 'ZCL_TEST_CAL_EXIT'
//      @ObjectModel.sort.transformedBy: 'ZCL_TEST_CAL_EXIT'
//      @ObjectModel.filter.transformedBy: 'ZCL_TEST_CAL_EXIT'
//      cast( '' as abap.char(20) ) as OrderTotal,                  

      _Item,
      _CompanyCode,
      _Status
}
