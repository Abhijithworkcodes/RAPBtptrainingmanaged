CLASS zap_cl_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
     INTERFACES: if_amdp_marker_hdb.
*     TYPES:
*      BEGIN OF ty_mara,
*        material_no TYPE mara-matnr,
*        person_resp    TYPE MARA-ernam,
*        created_on     TYPE mara-ersda,
*        END OF TY_MARA,
*         gt_mara_info TYPE STANDARD TABLE OF TY_MARA.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zap_cl_test IMPLEMENTATION.
ENDCLASS.
