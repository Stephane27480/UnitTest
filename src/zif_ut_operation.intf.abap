INTERFACE zif_ut_operation
  PUBLIC .
  "!<H1>Addition Method</H1>
    METHODS addition
      IMPORTING
        iv_num1          TYPE i
        iv_num2          TYPE i
      RETURNING
        VALUE(rv_number) TYPE i   .
    "!<H1>substraction Method</H1>
    METHODS substraction
      IMPORTING
        iv_num1          TYPE i
        iv_num2          TYPE i
      RETURNING
        VALUE(rv_number) TYPE i .
ENDINTERFACE.
