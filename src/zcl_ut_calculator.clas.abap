CLASS zcl_ut_calculator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES : ty_c1 TYPE c LENGTH 1,
            ty_c2 TYPE c LENGTH 2.
    INTERFACES zif_ut_calculate .
    ALIASES : compute FOR zif_ut_calculate~compute,
              set_operation FOR zif_ut_calculate~set_operation.

    DATA : m_operation TYPE REF TO zif_ut_operation.

  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS get_number_operation
      IMPORTING iv_operation     TYPE ty_c2
      RETURNING VALUE(rv_number) TYPE i.
    METHODS get_operation_type
      IMPORTING iv_index     TYPE i
                iv_operation TYPE ty_c2
      RETURNING VALUE(rv_op) TYPE ty_c1.
    METHODS do_maths
      IMPORTING iv_type        TYPE ty_c1
                iv_base        TYPE i
                iv_second      TYPE i
      RETURNING VALUE(rv_math) TYPE i.
ENDCLASS.

CLASS zcl_ut_calculator IMPLEMENTATION.

  METHOD compute.

    DATA(lv_nbop) = me->get_number_operation(  iv_operation  ).
    IF lv_nbop IS NOT INITIAL.
      DATA(lv_base) =  iv_num1 .
      me->set_operation(  ).
      DO lv_nbop TIMES.
        DATA(lv_second) = COND #( WHEN sy-index = 1
                                    THEN iv_num2
                                   WHEN sy-index = 2
                                    THEN iv_num3
                                     ).
        DATA(lv_type) = me->get_operation_type( iv_operation = iv_operation
                                         iv_index = sy-index ).
        lv_base = me->do_maths( iv_base = lv_base
                                iv_second = lv_second
                                iv_type = lv_type ).
      ENDDO.
      rv_value = lv_base.
    ENDIF.

  ENDMETHOD.


  METHOD set_operation.
    IF m_operation IS NOT BOUND.
      m_operation = new zcl_ut_operations(  ) .
    ENDIF.
  ENDMETHOD.

  METHOD get_number_operation.
    rv_number = strlen( iv_operation ).
  ENDMETHOD.

  METHOD get_operation_type.
    DATA(lv_pos) = iv_index - 1.
    rv_op = iv_operation+lv_pos(1) .
  ENDMETHOD.




  METHOD do_maths.

    rv_math = COND #(  WHEN iv_type EQ 'A' THEN m_operation->addition( iv_num1 = iv_base iv_num2 = iv_second )
                       WHEN iv_type EQ 'S' THEN m_operation->substraction( iv_num1 = iv_base iv_num2 = iv_second )
                          ).
  ENDMETHOD.
ENDCLASS.
