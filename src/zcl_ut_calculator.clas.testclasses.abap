*"* use this source file for your ABAP unit test classes
CLASS ltc_number_operation DEFINITION deferred.
class zcl_ut_calculator DEFINITION LOCAL FRIENDS ltc_number_operation.

CLASS ltc_get_operation DEFINITION deferred.
class zcl_ut_calculator DEFINITION LOCAL FRIENDS ltc_get_operation.

CLASS ltc_compute DEFINITION deferred.
class zcl_ut_calculator DEFINITION LOCAL FRIENDS ltc_compute.


CLASS ltc_number_operation DEFINITION FOR TESTING
                            RISK LEVEL HARMLESS
                            DURATION SHORT.

  PRIVATE SECTION.
    DATA m_cut TYPE REF TO zcl_ut_calculator.
    METHODS setup.
    METHODS get_2_op FOR TESTING RAISING cx_static_check.
    METHODS get_1_op FOR TESTING RAISING cx_static_check.
    METHODS get_0_op FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltc_get_operation DEFINITION FOR TESTING
                            RISK LEVEL HARMLESS
                            DURATION SHORT.

  PRIVATE SECTION.
    DATA m_cut TYPE REF TO zcl_ut_calculator.
    METHODS setup.
    METHODS get_1_o_2_optype FOR TESTING RAISING cx_static_check.
    METHODS get_1_optype FOR TESTING RAISING cx_static_check.
    METHODS get_0_optype FOR TESTING RAISING cx_static_check.
    METHODS get_2_o_2_optype FOR TESTING RAISING cx_static_check.
ENDCLASS.

CLASS ltc_compute DEFINITION FOR TESTING
                            RISK LEVEL HARMLESS
                            DURATION SHORT.

  PRIVATE SECTION.
    DATA m_cut TYPE REF TO zcl_ut_calculator.
    METHODS setup.
    METHODS compute_2_op FOR TESTING RAISING cx_static_check.
    METHODS compute_1_op FOR TESTING RAISING cx_static_check.
    METHODS compute_2A_op FOR TESTING RAISING cx_static_check.
ENDCLASS.

CLASS ltc_compute IMPLEMENTATION.

  METHOD compute_1_op.
    "When
    data(rv_result) = m_cut->compute( iv_operation = 'S'
                                      iv_num1  = 10
                                      iv_num2  = 22
                                      iv_num3 =  30
                                       ).
    "Then
    cl_abap_unit_assert=>assert_equals( msg = 'waou' exp = -12 act = rv_result ).
  ENDMETHOD.

  METHOD compute_2A_op.
    "When
    data(rv_result) = m_cut->compute( iv_operation = 'AA'
                                      iv_num1  = 10
                                      iv_num2  = 22
                                      iv_num3 =  30
                                       ).
    "Then
    cl_abap_unit_assert=>assert_equals( msg = 'waou' exp = 62 act = rv_result ).
  ENDMETHOD.

  METHOD compute_2_op.
        "When
    data(rv_result) = m_cut->compute( iv_operation = 'SA'
                                      iv_num1  = 22
                                      iv_num2  = 10
                                      iv_num3 =  30
                                       ).
    "Then
    cl_abap_unit_assert=>assert_equals( msg = 'waou' exp = 42 act = rv_result ).
  ENDMETHOD.

  METHOD setup.
    "given
    m_cut = NEW #(  ).
  ENDMETHOD.

ENDCLASS.


CLASS ltc_number_operation IMPLEMENTATION.
  METHOD setup.
    "given
    m_cut = NEW #(  ).
  ENDMETHOD.

  METHOD get_0_op.
    "when
    data(rv_num_op) = m_cut->get_number_operation( '' ).
    "then
    cl_abap_unit_assert=>assert_equals( msg = 'not good number of operation' exp = 0 act = rv_num_op ).
  ENDMETHOD.

  METHOD get_1_op.
    "when
    data(rv_num_op) = m_cut->get_number_operation( iv_operation = 'A' ).

    "then
    cl_abap_unit_assert=>assert_equals( msg = 'not good number of operation' exp = 1 act = rv_num_op ).
  ENDMETHOD.

  METHOD get_2_op.
    "when
    data(rv_num_op) = m_cut->get_number_operation( iv_operation = 'AS' ).
    "then
    cl_abap_unit_assert=>assert_equals( msg = 'not good number of operation' exp = 2 act = rv_num_op ).
  ENDMETHOD.

ENDCLASS.


CLASS ltc_get_operation IMPLEMENTATION.

  METHOD get_0_optype.
    "when
    data(rv_num_op) = m_cut->get_operation_type( iv_operation = ''
                                                    iv_index = 1 ).
    "then
    cl_abap_unit_assert=>assert_equals( msg = 'not good number of operation' exp = '' act = rv_num_op ).
  ENDMETHOD.

  METHOD get_1_optype.
    "when
    data(rv_num_op) = m_cut->get_operation_type( iv_operation = 'S'
                                                  iv_index = 1  ).
    "then
    cl_abap_unit_assert=>assert_equals( msg = 'not S from S' exp = 'S' act = rv_num_op ).
  ENDMETHOD.

  METHOD get_1_o_2_optype.
    "when
    data(rv_num_op) = m_cut->get_operation_type( iv_operation = 'AS'
                                                  iv_index = 1   ).
    "then
    cl_abap_unit_assert=>assert_equals( msg = 'not A from AS 1' exp = 'A' act = rv_num_op ).
  ENDMETHOD.

   METHOD setup.
    "given
    m_cut = NEW #(  ).
  ENDMETHOD.

  METHOD get_2_o_2_optype.
        "when
    data(rv_num_op) = m_cut->get_operation_type( iv_operation = 'AS'
                                                  iv_index = 2   ).
    "then
    cl_abap_unit_assert=>assert_equals( msg = 'not A from AS 1' exp = 'S' act = rv_num_op ).
  ENDMETHOD.

ENDCLASS.
