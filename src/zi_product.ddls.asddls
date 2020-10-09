@AbapCatalog.sqlViewName: 'ZIPRODUCT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product'
@VDM.viewType: #BASIC
@ClientHandling.algorithm: #SESSION_VARIABLE
define view ZI_Product
  as select from zrap_product
  association [0..1] to ZI_ProductText as _Description on  $projection.ProductID = _Description.ProductID
                                                       and _Description.Language = $session.system_language
{

      @ObjectModel.text.association: '_Description'
  key product_id as ProductID,
      category   as Category,
      unit_price as UnitPrice,
      currency   as Currency,
      base_unit  as BaseUnit,

      _Description
}
