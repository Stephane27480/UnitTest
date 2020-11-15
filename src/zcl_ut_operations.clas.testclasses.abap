*"* use this source file for your ABAP unit test classes
class ltc_addition DEFINITION for testing
    risk level harmless
    duration short.

    private SECTION.
        data m_cut type ref to zcl_ut_operations.
    METHODS setup.
    methods addition_1_10 for testing raising cx_static_check.
    methods addition_19_200 for testing raising cx_static_check.
endclass.

CLASS ltc_addition IMPLEMENTATION.

  METHOD addition_19_200.
   "when
    data(result) = m_cut->addition( iv_num1 = 19
                                    iv_num2 = 200  ).
    "then
    cl_abap_unit_assert=>assert_equals( msg = 'Waou tu sais pas compter' exp = 219 act = result ).
  ENDMETHOD.

  METHOD addition_1_10.
    "when
    data(result) = m_cut->addition( iv_num1 = 1
                                    iv_num2 = 10  ).
    "then
    cl_abap_unit_assert=>assert_equals( msg = 'Waou tu sais pas compter' exp = 11 act = result ).
  ENDMETHOD.

  METHOD setup.
    "given
    m_cut = new #( ).
  ENDMETHOD.

ENDCLASS.
