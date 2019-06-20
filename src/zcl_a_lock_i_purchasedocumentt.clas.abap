class ZCL_A_LOCK_I_PURCHASEDOCUMENTT definition
  public
  inheriting from /BOBF/CL_LIB_A_LOCK_ACTIVE
  final
  create public .

public section.

  methods /BOBF/IF_LIB_LOCK_ACTIVE~LOCK_ACTIVE_ENTITY
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZCL_A_LOCK_I_PURCHASEDOCUMENTT IMPLEMENTATION.


  method /BOBF/IF_LIB_LOCK_ACTIVE~LOCK_ACTIVE_ENTITY.
  endmethod.
ENDCLASS.
