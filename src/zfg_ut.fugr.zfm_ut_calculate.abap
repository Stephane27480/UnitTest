function zfm_ut_calculate.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IM_OPERATION) TYPE  CHAR1
*"     REFERENCE(IM_BASE) TYPE  I
*"     REFERENCE(IM_FIRST) TYPE  I
*"     REFERENCE(IM_SECOND) TYPE  I OPTIONAL
*"  EXPORTING
*"     REFERENCE(EX_RESULT) TYPE  I
*"----------------------------------------------------------------------
"!<H1>fonction de calcul</H1>
constants  lc_addition type char1 value 'A'.
constants  lc_substraction type char1 value 'S'.

data(lo_class) = new zcl_ut_calculate( im_base ).

case im_operation.
when lc_addition.
    ex_result = lo_class->compute(
                  iv_operation = lc_addition
                  iv_num1      = im_first
*                  iv_num2      =
                ).
when lc_substraction.
        ex_result = lo_class->compute(
                  iv_operation = lc_substraction
                  iv_num1      = im_first
*                  iv_num2      =
                ).
when others.
ex_result = lo_class->compute(
                  iv_operation = lc_substraction
                  iv_num1      = im_first
                  iv_num2      = im_second
                ).
endcase.


ENDFUNCTION.
