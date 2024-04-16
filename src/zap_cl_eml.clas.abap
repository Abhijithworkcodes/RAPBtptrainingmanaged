CLASS zap_cl_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zap_cl_eml IMPLEMENTATION.
     METHOD if_oo_adt_classrun~main.
     " step 1 - READ
*     READ ENTITIES OF zap_cds_travel
*        ENTITY Travel
*         FROM VALUE #( ( TravelUUID = '729B9443D7C825D71800844681A7ECD3'  )  )
*
*        RESULT DATA(travels).
*        "op will have only travel uuid
*        out->write( travels ).

*    " step 2 - READ with Fields
*    READ ENTITIES OF zap_cds_travel
*        ENTITY Travel
*         FIELDS ( AgencyID CustomerID )
*         WITH VALUE #( ( TravelUUID = '729B9443D7C825D71800844681A7ECD3' ) )
*         RESULT DATA(travels).
*
*         out->write( travels ).
*   " step 3 - READ with All Fields
*    READ ENTITIES OF zap_cds_travel
*      ENTITY travel
*        ALL FIELDS
*      WITH VALUE #( ( TravelUUID = '729B9443D7C825D71800844681A7ECD3' ) )
*      RESULT DATA(travels).
*
*    out->write( travels ).
" step 4 - READ By Association
*    READ ENTITIES OF zap_cds_travel
*        ENTITY Travel BY \_Booking
*        ALL FIELDS WITH VALUE #( ( TravelUUID = '729B9443D7C825D71800844681A7ECD3' ) )
*        RESULT DATA(booking).
*
*        out->write( booking ).

" step 5 - Unsuccessful READ
*    READ ENTITIES OF zap_cds_travel
*      ENTITY travel
*        ALL FIELDS WITH VALUE #( ( TravelUUID = '11111111111111111111111111111111' ) )
*      RESULT DATA(travels)
*      FAILED DATA(failed)
*      REPORTED DATA(reported).
*      out->write( travels ).
*    out->write( failed ).    " complex structures not supported by the console output
*    out->write( reported ).  " complex structures not supported by the console output

*    " step 6 - MODIFY Update
*MODIFY ENTITIES OF zap_cds_travel
*    ENTITY Travel
*    UPDATE
*     SET FIELDS WITH VALUE #( ( TravelUUID = '729B9443D7C825D71800844681A7ECD3'
*                                Description = 'updated with class' ) )
*
*     FAILED DATA(failed)
*     REPORTED DATA(reported).
*
*     "Commit
*     COMMIT ENTITIES
*        RESPONSE OF zap_cds_travel
*        FAILED DATA(failed_commit)
*        REPORTED DATA(reported_commit).
*
*        out->write( 'Updated done' ).

*    " step 7 - MODIFY Create
*MODIFY ENTITIES OF zap_cds_travel
*   ENTITY Travel
*   CREATE
*    SET FIELDS WITH VALUE
*    #( ( %cid        = 'MyContentID_1'
*        AgencyID    = '70012'
*        CustomerID  = '14'
*        BeginDate   = cl_abap_context_info=>get_system_date( )
*        EndDate     = cl_abap_context_info=>get_system_date( ) + 10
*        Description = 'I like RAP Style' ) )
*
*
*        MAPPED DATA(mapped)
*        FAILED DATA(failed)
*        REPORTED DATA(reported).
*
*        out->write( mapped-travel ).
*        out->write( mapped-booking ).
*
*         COMMIT ENTITIES
*      RESPONSE OF zap_cds_travel
*      FAILED     DATA(failed_commit)
*      REPORTED   DATA(reported_commit).
*
*    out->write( 'Create done' ).
   " step 8 - MODIFY Delete
    MODIFY ENTITIES OF zap_cds_travel
      ENTITY travel
        DELETE FROM
          VALUE
            #( ( TravelUUID  = '5E3F300BC3D41EEEB3E099CB9B5DC4FA' ) )

     FAILED DATA(failed)
     REPORTED DATA(reported).

    COMMIT ENTITIES
      RESPONSE OF zap_cds_travel
      FAILED     DATA(failed_commit)
      REPORTED   DATA(reported_commit).

    out->write( 'Delete done' ).
     ENDMETHOD.
ENDCLASS.
