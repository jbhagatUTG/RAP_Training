CLASS lhc_Order DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE Order.

    METHODS read FOR READ
      IMPORTING keys FOR READ Order RESULT result.

    METHODS cba_ITEM FOR MODIFY
      IMPORTING entities_cba FOR CREATE Order\_item.

    METHODS rba_ITEM FOR READ
      IMPORTING keys_rba FOR READ Order\_item FULL result_requested RESULT result LINK association_links.

    METHODS Deliver FOR MODIFY
      IMPORTING
        Keys   FOR ACTION Order~Deliver
      RESULT
        result.

    METHODS Ship FOR MODIFY
      IMPORTING
        Keys   FOR ACTION Order~Ship
      RESULT
        result.

ENDCLASS.

CLASS lhc_Order IMPLEMENTATION.

  METHOD create.

    DATA: header TYPE zrap_order.

    LOOP AT entities INTO DATA(entity).

      header = VALUE #( order_id = entity-OrderID
                        bukrs = entity-CompanyCode
                        status = entity-OrderStatus ).

      zcl_order_behaviour=>get_instance( )->create_order(
        EXPORTING
          header = header
        IMPORTING
          failed = DATA(failed_flag) ).

      IF failed_flag EQ abap_true.

        failed = VALUE #( order = VALUE #( ( %cid = entity-%cid
                                                 %create = if_abap_behv=>fc-o-disabled
                                                 %fail = VALUE #( cause = if_abap_behv=>cause-unspecific ) ) ) ).

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD cba_ITEM.

    LOOP AT entities_cba INTO DATA(entity).

      zcl_order_behaviour=>get_instance( )->create_orderitems(
        EXPORTING
            orderid = entity-OrderID
            items = VALUE #( FOR item IN entity-%target ( product_id = item-ProductID
                                                          quantity = item-Quantity ) )
        IMPORTING
            failed = DATA(failed_flag) ).

      IF failed_flag EQ abap_true.

        failed = VALUE #( orderitem = VALUE #( ( %cid = entity-%cid_ref
                                                 %create = if_abap_behv=>fc-o-disabled
                                                 %fail = VALUE #( cause = if_abap_behv=>cause-unspecific ) ) ) ).

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD rba_ITEM.
  ENDMETHOD.

  METHOD deliver.

    LOOP AT keys INTO DATA(key).

      zcl_order_behaviour=>get_instance( )->deliver(
        EXPORTING
          orderid = key-OrderID
        IMPORTING
          failed  = DATA(failed_flag) ).

      IF failed_flag EQ abap_true.

        failed = VALUE #( order = VALUE #( ( %cid = key-%cid_ref
                                             %action = VALUE #( Deliver = failed_flag )
                                             %fail = VALUE #( cause = if_abap_behv=>cause-unspecific ) ) ) ).

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD ship.

  ENDMETHOD.

ENDCLASS.

CLASS lhc_OrderItem DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE OrderItem.

    METHODS read FOR READ
      IMPORTING keys FOR READ OrderItem RESULT result.

ENDCLASS.

CLASS lhc_OrderItem IMPLEMENTATION.

  METHOD create.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZI_ORDERBO DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS check_before_save REDEFINITION.

    METHODS finalize          REDEFINITION.

    METHODS save              REDEFINITION.

    METHODS adjust_numbers REDEFINITION.

    METHODS cleanup REDEFINITION.

ENDCLASS.

CLASS lsc_ZI_ORDERBO IMPLEMENTATION.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD finalize.
  ENDMETHOD.

  METHOD save.

    zcl_order_behaviour=>get_instance( )->save_data( ).

  ENDMETHOD.

  METHOD cleanup.

    zcl_order_behaviour=>get_instance( )->initialize( ).

  ENDMETHOD.

  METHOD adjust_numbers.

  ENDMETHOD.

ENDCLASS.
