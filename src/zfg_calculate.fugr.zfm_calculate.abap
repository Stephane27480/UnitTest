FUNCTION zfm_calculate.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IM_OPERATION) TYPE  CHAR1
*"     REFERENCE(IM_BASENUMBER) TYPE  I
*"     REFERENCE(IM_NUMBER1) TYPE  I
*"     REFERENCE(IM_NUMBER2) TYPE  I
*"  EXPORTING
*"     REFERENCE(EX_NUMBER) TYPE  I
*"----------------------------------------------------------------------
  CONSTANTS lc_addition TYPE char1 VALUE 'A'.
  CONSTANTS lc_substraction TYPE char1 VALUE 'S'.

  DATA(lo_class) = NEW zcl_ut_calculate(  im_basenumber ).

  CASE im_operation.

    WHEN lc_addition.
      ex_number = lo_class->compute(
               iv_operation = lc_addition
               iv_num1 = im_number1 ) .
    WHEN lc_substraction.
      ex_number = lo_class->compute(
               iv_operation = lc_substraction
               iv_num1 = im_number1 ) .
    WHEN OTHERS.
      ex_number = lo_class->compute( iv_num1 = im_number1
                                      iv_num2 = im_number2
                                      iv_operation = im_operation ).

  ENDCASE.



ENDFUNCTION.
