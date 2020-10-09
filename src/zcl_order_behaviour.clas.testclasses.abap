*"* use this source file for your ABAP unit test classes
CLASS ltcl_Order DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.

    METHODS: setup.
    METHODS:
      validate_deliver FOR TESTING RAISING cx_static_check.
    METHODS teardown.

    DATA: cut TYPE REF TO zcl_order_behaviour.              "cut = Class Under Test
ENDCLASS.


CLASS ltcl_Order IMPLEMENTATION.

  METHOD setup.     "Prepare

    cut = zcl_order_behaviour=>get_instance( ).

  ENDMETHOD.

  METHOD validate_deliver.

    cut->deliver(
      EXPORTING
        orderid = '0000000876'
      IMPORTING
        failed  = DATA(failed) ).

    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = failed
        exp                  = abap_false
*        ignore_hash_sequence = abap_false
*        tol                  =
*        msg                  =
*        level                = if_abap_unit_constant=>severity-medium
*        quit                 = if_abap_unit_constant=>quit-test
*      RECEIVING
*        assertion_failed     =
    ).

  ENDMETHOD.

  METHOD teardown.      "Undo

    CLEAR: cut.

  ENDMETHOD.

ENDCLASS.
