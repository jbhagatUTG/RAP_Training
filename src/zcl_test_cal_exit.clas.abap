CLASS zcl_test_cal_exit DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_sadl_exit_calc_element_read .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_cal_exit IMPLEMENTATION.
  METHOD if_sadl_exit_calc_element_read~calculate.

    DATA: lt_data TYPE TABLE OF ZI_ORDERBO WITH DEFAULT KEY.

    BREAK-POINT.

    lt_data = CORRESPONDING #( it_original_data ).

    LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<fs>).
      <fs>-OrderTotal = 'Test'.
    ENDLOOP.

    ct_calculated_data = CORRESPONDING #( lt_data ).

  ENDMETHOD.



  METHOD if_sadl_exit_calc_element_read~get_calculation_info.

    BREAK-POINT.

  ENDMETHOD.

ENDCLASS.
