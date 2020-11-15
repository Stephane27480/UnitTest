"!<H1>Classe pour réaliser les opérations de base</H1>
CLASS zcl_ut_operations DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_ut_operation .
    ALIASES : addition FOR zif_ut_operation~addition,
              substraction FOR zif_ut_operation~substraction
              .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ut_operations IMPLEMENTATION.


  METHOD zif_ut_operation~addition.
    rv_number = iv_num1 + iv_num2 .
  ENDMETHOD.


  METHOD zif_ut_operation~substraction.
    rv_number = iv_num1 - iv_num2 .
  ENDMETHOD.
ENDCLASS.
