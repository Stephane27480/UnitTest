*"* use this source file for your ABAP unit test classes
class ltc_get_operation definition DEFERRED.
class ltc_number_operation definition DEFERRED.
class ZCL_UT_CALCULATOR DEFINITION
                LOCAL FRIENDS
                    ltc_number_operation
                    ltc_get_operation.


CLASS ltc_number_operation DEFINITION FOR TESTING
                            RISK LEVEL HARMLESS
                            DURATION SHORT
                            .

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
    DATA :  m_td_operations TYPE REF TO zif_ut_operation.
    METHODS setup.
    METHODS compute_2_op FOR TESTING RAISING cx_static_check.
    METHODS compute_1_op FOR TESTING RAISING cx_static_check.
    METHODS compute_2A_op FOR TESTING RAISING cx_static_check.
    methods teardown.
ENDCLASS.

CLASS ltc_compute IMPLEMENTATION.


  METHOD setup.
    "given
     "Step 1 : create the test double of interface type
    m_td_operations ?= cl_abap_testdouble=>create( 'zif_ut_operation' ).
    m_cut = NEW #(  ).
    m_cut->m_operation = m_td_operations.
  ENDMETHOD.

  METHOD compute_1_op.
    "given
    "Step 2: configure the test double behavior
    cl_abap_testdouble=>configure_call(  m_td_operations
                                        )->ignore_all_parameters(
                                        )->returning( 3
                                        )->and_expect(
                                        )->is_called_times( 1 ).
    "Step 3: configure the test double method
    m_td_operations->substraction(
                       exporting
                        iv_num1 = 1
                        iv_num2 = 2
                        ).

    "When
    DATA(rv_result) = m_cut->compute( iv_operation = 'S'
                                      iv_num1  = 10
                                      iv_num2  = 22
                                      iv_num3 =  30
                                       ).
    "Then
    cl_abap_testdouble=>verify_expectations( m_td_operations ).
    cl_abap_unit_assert=>assert_equals( msg = 'waou' exp = 3 act = rv_result ).
  ENDMETHOD.

  METHOD compute_2A_op.
    "given
    "Step 2: configure the test double behavior
    cl_abap_testdouble=>configure_call(  m_td_operations
                                        )->ignore_all_parameters(
                                        )->returning( 2
                                        )->and_expect(
                                        )->is_called_times( 2 ).
    "Step 3: configure the test double method
    m_td_operations->addition(
                       exporting
                        iv_num1 = 1
                        iv_num2 = 2
                        ).


    "When
    DATA(rv_result) = m_cut->compute( iv_operation = 'AA'
                                      iv_num1  = 10
                                      iv_num2  = 22
                                      iv_num3 =  30
                                       ).
    "Then
    cl_abap_testdouble=>verify_expectations( m_td_operations ).
    cl_abap_unit_assert=>assert_equals( msg = 'waou' exp = 2 act = rv_result ).
  ENDMETHOD.

  METHOD compute_2_op.
    "given
     "Step 2: configure the test double behavior
    cl_abap_testdouble=>configure_call(  m_td_operations
                                        )->ignore_all_parameters(
                                        )->returning( 2
                                        )->and_expect(
                                        )->is_called_times( 1 ).
    "Step 3: configure the test double method
    m_td_operations->addition(
                       exporting
                        iv_num1 = 1
                        iv_num2 = 2
                        ).
   "Step 2: configure the test double behavior
    cl_abap_testdouble=>configure_call(  m_td_operations
                                        )->ignore_all_parameters(
                                        )->returning( 3
                                        )->and_expect(
                                        )->is_called_times( 1 ).
    "Step 3: configure the test double method
    m_td_operations->substraction(
                       exporting
                        iv_num1 = 1
                        iv_num2 = 2
                        ).

    "When
    DATA(rv_result) = m_cut->compute( iv_operation = 'SA'
                                      iv_num1  = 22
                                      iv_num2  = 10
                                      iv_num3 =  30
                                       ).
    "Then
    cl_abap_testdouble=>verify_expectations( m_td_operations ).
    cl_abap_unit_assert=>assert_equals( msg = 'waou' exp = 2 act = rv_result ).
  ENDMETHOD.


  METHOD teardown.
    clear: m_td_operations, m_cut.
  ENDMETHOD.

ENDCLASS.


CLASS ltc_number_operation IMPLEMENTATION.
  METHOD setup.
    "given

    m_cut = NEW #(  ).
  ENDMETHOD.

  METHOD get_0_op.
    "when
    DATA(rv_num_op) = m_cut->get_number_operation( '' ).
    "then
    cl_abap_unit_assert=>assert_equals( msg = 'not good number of operation' exp = 0 act = rv_num_op ).
  ENDMETHOD.

  METHOD get_1_op.
    "when
    DATA(rv_num_op) = m_cut->get_number_operation( iv_operation = 'A' ).

    "then
    cl_abap_unit_assert=>assert_equals( msg = 'not good number of operation' exp = 1 act = rv_num_op ).
  ENDMETHOD.

  METHOD get_2_op.
    "when
    DATA(rv_num_op) = m_cut->get_number_operation( iv_operation = 'AS' ).
    "then
    cl_abap_unit_assert=>assert_equals( msg = 'not good number of operation' exp = 2 act = rv_num_op ).
  ENDMETHOD.


ENDCLASS.


CLASS ltc_get_operation IMPLEMENTATION.

  METHOD get_0_optype.
    "when
    DATA(rv_num_op) = m_cut->get_operation_type( iv_operation = ''
                                                    iv_index = 1 ).
    "then
    cl_abap_unit_assert=>assert_equals( msg = 'not good number of operation' exp = '' act = rv_num_op ).
  ENDMETHOD.

  METHOD get_1_optype.
    "when
    DATA(rv_num_op) = m_cut->get_operation_type( iv_operation = 'S'
                                                  iv_index = 1  ).
    "then
    cl_abap_unit_assert=>assert_equals( msg = 'not S from S' exp = 'S' act = rv_num_op ).
  ENDMETHOD.

  METHOD get_1_o_2_optype.
    "when
    DATA(rv_num_op) = m_cut->get_operation_type( iv_operation = 'AS'
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
    DATA(rv_num_op) = m_cut->get_operation_type( iv_operation = 'AS'
                                                  iv_index = 2   ).
    "then
    cl_abap_unit_assert=>assert_equals( msg = 'not A from AS 1' exp = 'S' act = rv_num_op ).
  ENDMETHOD.

ENDCLASS.
