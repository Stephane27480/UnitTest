CLASS zcl_ut_calculate DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA : m_number TYPE i.
"!<H2>Constructor Method</H2>
    METHODS constructor
      IMPORTING
        iv_number TYPE i.
"!<H2>Méthode public COMPUTE</H2>
"! <p> qui effectue les calcul
    METHODS compute
      IMPORTING
        iv_operation    TYPE char1
        iv_num1         TYPE i
        iv_num2         TYPE i OPTIONAL
      RETURNING
        VALUE(rv_value) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
"!<H2>Addition Method</H2>
    METHODS addition
      IMPORTING
        iv_num1          TYPE i
        iv_num2          TYPE i
      RETURNING
        VALUE(rv_number) TYPE i   .
"!<H2>substraction Method</H2>
    METHODS substraction
      IMPORTING
        iv_num1          TYPE i
        iv_num2          TYPE i
      RETURNING
        VALUE(rv_number) TYPE i .


ENDCLASS.


CLASS zcl_ut_calculate IMPLEMENTATION.
  METHOD constructor.
    me->m_number = iv_number.
  ENDMETHOD.

  METHOD addition.
    rv_number = iv_num1 + iv_num2 .
  ENDMETHOD.

  METHOD substraction.
    rv_number = iv_num1 - iv_num2 .
  ENDMETHOD.

  METHOD compute.
    CONSTANTS : lc_addition     TYPE char1 VALUE 'A'.
    CONSTANTS : lc_substraction TYPE char1 VALUE 'S'.
    CONSTANTS : lc_both   TYPE char1 VALUE 'B'.

    rv_value = COND #(  WHEN iv_operation = lc_addition
                        THEN  me->addition( EXPORTING
                                                iv_num1 = me->m_number
                                                iv_num2 = iv_num1 )
                        WHEN iv_operation = lc_substraction
                        THEN   me->substraction( EXPORTING
                                                iv_num1 = me->m_number
                                                iv_num2 = iv_num1 )
                        ELSE
                               me->substraction( EXPORTING
                                                iv_num1 =  me->addition( EXPORTING
                                                                            iv_num1 = me->m_number
                                                                            iv_num2 = iv_num1 )
                                                iv_num2 = iv_num2
                                                )
                              ).

  ENDMETHOD.

ENDCLASS.
