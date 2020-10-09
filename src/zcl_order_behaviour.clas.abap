CLASS zcl_order_behaviour DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE .

  PUBLIC SECTION.

    TYPES: tt_items TYPE TABLE OF zrap_orderitem.

    CLASS-METHODS:
      get_instance
        RETURNING
          VALUE(object) TYPE REF TO zcl_order_behaviour.

    METHODS create_order
      IMPORTING
        header TYPE zrap_order
      EXPORTING
        failed TYPE xfeld.

    METHODS create_orderitems
      IMPORTING
        orderid TYPE zdorderid
        items   TYPE tt_items
      EXPORTING
        failed  TYPE xfeld.

    METHODS deliver
      IMPORTING
        orderid TYPE zdorderid
      EXPORTING
        failed  TYPE xfeld.

    METHODS save_data.
    METHODS initialize.

  PROTECTED SECTION.
  PRIVATE SECTION.

    CLASS-DATA: m_instance TYPE REF TO zcl_order_behaviour.
    DATA: m_header TYPE zrap_order,
          m_items  TYPE tt_items.
ENDCLASS.



CLASS zcl_order_behaviour IMPLEMENTATION.

  METHOD get_instance.

    IF m_instance IS NOT BOUND.

      m_instance = NEW #( ).

    ENDIF.

    object = m_instance.

  ENDMETHOD.

  METHOD create_order.

    m_header = header.

  ENDMETHOD.

  METHOD save_data.

    MODIFY zrap_order FROM m_header.
    MODIFY zrap_orderitem FROM TABLE m_items.

  ENDMETHOD.

  METHOD initialize.
    CLEAR: m_instance.
  ENDMETHOD.

  METHOD create_orderitems.

    m_items = VALUE #( FOR item IN items INDEX INTO indx
                        ( order_id = orderid
                          item_no = indx
                          product_id = item-product_id
                          quantity = item-quantity ) ).

  ENDMETHOD.

  METHOD deliver.

    SELECT SINGLE * FROM zrap_order INTO @m_header WHERE order_id EQ @orderid.

    IF m_header-status NE 'DELV'.

      m_header-status = 'DELV'.

    ELSE.

      failed = abap_true.

    ENDIF.
  ENDMETHOD.

ENDCLASS.
