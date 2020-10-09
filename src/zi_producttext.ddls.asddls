@AbapCatalog.sqlViewName: 'ZIPRODUCTT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product Text'
@VDM.viewType: #BASIC
@ObjectModel.dataCategory: #TEXT

define view ZI_ProductText
  as select from zrap_productt
  association [1]    to I_Language as _Language on $projection.Language = _Language.Language
{
      @Semantics.language: true
      @ObjectModel.foreignKey.association: '_Language'
  key spras       as Language,
      @ObjectModel.text.element: 'ProductDescription'
  key product_id  as ProductID,
      @Semantics.text: true
      description as ProductDescription,

      _Language
}
