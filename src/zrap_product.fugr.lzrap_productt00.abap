*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 05.10.2020 at 07:36:11
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZRAP_PRODUCT....................................*
DATA:  BEGIN OF STATUS_ZRAP_PRODUCT                  .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZRAP_PRODUCT                  .
CONTROLS: TCTRL_ZRAP_PRODUCT
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZRAP_PRODUCT                  .
TABLES: *ZRAP_PRODUCTT                 .
TABLES: ZRAP_PRODUCT                   .
TABLES: ZRAP_PRODUCTT                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
