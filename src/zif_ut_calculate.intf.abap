interface ZIF_UT_CALCULATE
  public .
 METHODS compute
      IMPORTING
        iv_operation    TYPE char2
        iv_num1         TYPE i
        iv_num2         TYPE i
        iv_num3         TYPE i OPTIONAL
      RETURNING
        VALUE(rv_value) TYPE i.
  METHODS set_operation.
endinterface.
