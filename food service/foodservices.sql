
CREATE TABLE "FOOD_CATEGORY"
(
    "CAT_NO"         NUMBER,
    "CAT_NAME"       VARCHAR2 (100),
    "DESCRIPTION"    VARCHAR2 (500),
    CONSTRAINT "FOOD_CATEGORY_CON" PRIMARY KEY ("CAT_NO") USING INDEX ENABLE
);
/

CREATE TABLE "FOOD_ITEM"
(
    "ITEM_NO"        NUMBER,
    "ITEM_NAME"      VARCHAR2 (100),
    "ITEM_DESC"      VARCHAR2 (500),
    "UOM_NO"         NUMBER,
    "CATEGORY_NO"    NUMBER,
    "RATE"           NUMBER NOT NULL ENABLE,
    "PHOTO"          BLOB,
    "MIMETYPE"       VARCHAR2 (100),
    CONSTRAINT "FOOD_ITEM_CON" PRIMARY KEY ("ITEM_NO") USING INDEX ENABLE
);

ALTER TABLE "FOOD_ITEM"
    ADD CONSTRAINT "FOOD_ITEM_CON2" FOREIGN KEY ("UOM_NO")
            REFERENCES "IN_UOM" ("UOM_NO")
            ENABLE;

ALTER TABLE "FOOD_ITEM"
    ADD CONSTRAINT "FOOD_ITEM_CON3" FOREIGN KEY ("CATEGORY_NO")
            REFERENCES "FOOD_CATEGORY" ("CAT_NO")
            ENABLE;
/

CREATE TABLE "FOOD_ITEM_DETAIL"
(
    "SLNO"               NUMBER,
    "ITEM_NO"            NUMBER,
    "FORMULA_ITEM_NO"    NUMBER,
    "QTY"                NUMBER NOT NULL ENABLE,
    CONSTRAINT "FOOD_ITEM_DETAIL_CON" PRIMARY KEY
        ("ITEM_NO", "FORMULA_ITEM_NO")
        USING INDEX ENABLE
);

ALTER TABLE "FOOD_ITEM_DETAIL"
    ADD CONSTRAINT "FOOD_ITEM_DETAIL_CON2" FOREIGN KEY ("FORMULA_ITEM_NO")
            REFERENCES "FORMULATION_ITEM" ("ITEM_NO")
            ENABLE;
/


CREATE TABLE "FORMULATION_ITEM"
(
    "ITEM_NO"      NUMBER,
    "ITEM_NAME"    VARCHAR2 (100),
    "ITEM_DESC"    VARCHAR2 (500),
    "UOM_NO"       NUMBER,
    CONSTRAINT "FORMULATION_ITEM_CON" PRIMARY KEY ("ITEM_NO")
        USING INDEX ENABLE
);

ALTER TABLE "FORMULATION_ITEM"
    ADD CONSTRAINT "FORMULATION_ITEM_CON2" FOREIGN KEY ("UOM_NO")
            REFERENCES "IN_UOM" ("UOM_NO")
            ENABLE;
/


CREATE TABLE "GL_SL_CODE"
(
    "SLCODE"             VARCHAR2 (100) NOT NULL ENABLE,
    "SLNAME"             VARCHAR2 (200),
    "LOC_CODE"           NUMBER,
    "SRLOC"              VARCHAR2 (10),
    "SLTYPE"             VARCHAR2 (7),
    "PARTY_TP"           NUMBER (1, 0),
    "CODETYP"            NUMBER (2, 0),
    "ADDR1"              VARCHAR2 (300),
    "ADDR2"              VARCHAR2 (60),
    "ADDR3"              VARCHAR2 (60),
    "ADDR4"              VARCHAR2 (60),
    "CONTACT_PERSON"     VARCHAR2 (150),
    "CONTACT_NO"         VARCHAR2 (30),
    "CONTACT_ADDRESS"    VARCHAR2 (300),
    "REGNO"              VARCHAR2 (25),
    "REGDATE"            DATE,
    "CONTACTP"           VARCHAR2 (30),
    "TELEPHONE"          VARCHAR2 (30),
    "FAXNO"              VARCHAR2 (30),
    "EMAILNO"            VARCHAR2 (40),
    "MLINK"              NUMBER (4, 0),
    "CASHDEPOT"          NUMBER,
    "ZILLA_CODE"         VARCHAR2 (3),
    "UPOZILLA_CODE"      VARCHAR2 (15),
    "TIN"                VARCHAR2 (30),
    "NID"                VARCHAR2 (17),
    "STATUS"             NUMBER (1, 0),
    "VAT_SYN"            NUMBER DEFAULT 0,
    "ENTRY_USER"         VARCHAR2 (50),
    "ENTRY_USERPC"       VARCHAR2 (50),
    "ENTRY_DATE"         DATE DEFAULT SYSDATE NOT NULL ENABLE,
    "UPDATE_USER"        VARCHAR2 (50),
    "UPDATE_USERPC"      VARCHAR2 (100),
    "UPDATE_DATE"        DATE,
    CONSTRAINT "GL_SLCODE_PK" PRIMARY KEY ("SLCODE") USING INDEX ENABLE,
    CONSTRAINT "GL_MRN_L_U" UNIQUE ("MLINK") USING INDEX ENABLE
);

ALTER TABLE "GL_SL_CODE"
    ADD CONSTRAINT "GL_SLCODE_UPZILLA_FK" FOREIGN KEY ("UPOZILLA_CODE")
            REFERENCES "SLS_ZONE_MASTER" ("NEW_ZONE")
            ENABLE;
/

CREATE TABLE "IN_UOM"
(
    "UOM_NO"        NUMBER,
    "UOM_NAME"      VARCHAR2 (50),
    "SHORT_NAME"    VARCHAR2 (10),
    "UNIT_QTY"      NUMBER,
    CONSTRAINT "IN_UOM_CON" PRIMARY KEY ("UOM_NO") USING INDEX ENABLE,
    CONSTRAINT "IN_UOM_CON2" UNIQUE ("SHORT_NAME") USING INDEX ENABLE
);
/

CREATE TABLE "LOCATION"
(
    "LOC_CODE"    NUMBER,
    "LOC_NAME"    VARCHAR2 (200) NOT NULL ENABLE,
    "LOC_DES"     VARCHAR2 (400),
    "LOC_TYPE"    NUMBER (1, 0) NOT NULL ENABLE,
    CONSTRAINT "LOCATION_PK" PRIMARY KEY ("LOC_CODE") USING INDEX ENABLE
);
/

CREATE TABLE "ORDER_DETAIL"
(
    "ORDER_DTLNO"      NUMBER NOT NULL ENABLE,
    "ORDER_NO"         NUMBER,
    "ORD_MDATE"        DATE,
    "ORD_RLOC"         NUMBER,
    "ITEM_NO"          NUMBER NOT NULL ENABLE,
    "QTY"              NUMBER NOT NULL ENABLE,
    "RATE"             NUMBER NOT NULL ENABLE,
    "PROMO_DIS"        NUMBER,
    "OTHER_DIS"        NUMBER,
    "ENTRY_USER"       VARCHAR2 (50),
    "ENTRY_USERPC"     VARCHAR2 (50),
    "ENTRY_DATE"       DATE DEFAULT SYSDATE NOT NULL ENABLE,
    "UPDATE_USER"      VARCHAR2 (50),
    "UPDATE_USERPC"    VARCHAR2 (100),
    "UPDATE_DATE"      DATE,
    "VOID_TYPE"        NUMBER DEFAULT 0,
    "VOID_QTY"         NUMBER DEFAULT 0,
    "VOID_REASON"      VARCHAR2 (300),
    "VAT_SYN"          NUMBER DEFAULT 0,
    CONSTRAINT "CON_ORDER_DETAIL_PK" PRIMARY KEY ("ORDER_DTLNO")
        USING INDEX ENABLE
);

ALTER TABLE "ORDER_DETAIL"
    ADD CONSTRAINT "CON_ORDER_DETAIL_FK" FOREIGN KEY ("ORDER_NO")
            REFERENCES "ORDER_MASTER" ("ORDER_NO")
            ENABLE;

ALTER TABLE "ORDER_DETAIL"
    ADD CONSTRAINT "ORDER_DETAIL_MODEL_FK" FOREIGN KEY ("ITEM_NO")
            REFERENCES "FOOD_ITEM" ("ITEM_NO")
            ENABLE;
/


CREATE TABLE "ORDER_MASTER"
(
    "ORDER_NO"             NUMBER NOT NULL ENABLE,
    "ORD_TRCODE"           VARCHAR2 (3),
    "ORD_FYEAR"            VARCHAR2 (2),
    "ORD_SERIALNO"         NUMBER,
    "ORD_MDATE"            DATE NOT NULL ENABLE,
    "ORD_RLOC"             NUMBER NOT NULL ENABLE,
    "ORD_ILOC"             NUMBER,
    "ORD_SLCODE"           VARCHAR2 (20),
    "ORD_EMP"              VARCHAR2 (5),
    "ORD_DESADD"           VARCHAR2 (250),
    "ORD_DELIVERYPHNNO"    VARCHAR2 (25),
    "ORD_REMARKS"          VARCHAR2 (250),
    "ORD_PAYMODE"          NUMBER,
    "ORD_VAT"              NUMBER,
    "ORD_TRANS"            NUMBER,
    "ORD_GROSS"            NUMBER,
    "ORD_DIS"              NUMBER,
    "NET_AMOUNT"           NUMBER,
    "PAID_AMOUNT"          NUMBER,
    "PRINT_FLAG"           NUMBER DEFAULT 1,
    "ENTRY_USER"           VARCHAR2 (50),
    "ENTRY_USERPC"         VARCHAR2 (100),
    "ENTRY_DATE"           DATE DEFAULT SYSDATE NOT NULL ENABLE,
    "UPDATE_USER"          VARCHAR2 (50),
    "UPDATE_USERPC"        VARCHAR2 (100),
    "UPDATE_DATE"          DATE,
    "VOID_FLAG"            NUMBER DEFAULT 0,
    "VOID_TYPE"            NUMBER DEFAULT 0,
    "VOID_REASON"          VARCHAR2 (300),
    "VOID_BY"              VARCHAR2 (10),
    "VOID_DATE"            DATE,
    "VOID_REQ_BY"          VARCHAR2 (10),
    "VOID_REQ_FROM"        NUMBER,
    CONSTRAINT "ORDERMST_NO_PK" PRIMARY KEY ("ORDER_NO") USING INDEX ENABLE,
    CONSTRAINT "ORDERMST_NO_UN" UNIQUE ("ORD_TRCODE",
                                        "ORD_FYEAR",
                                        "ORD_SERIALNO",
                                        "ORD_RLOC")
        USING INDEX ENABLE
);

ALTER TABLE "ORDER_MASTER"
    ADD CONSTRAINT "ORR_MST_SLCODE_FK" FOREIGN KEY ("ORD_SLCODE")
            REFERENCES "GL_SL_CODE" ("SLCODE")
            ENABLE;
/



CREATE TABLE "RECEIPT_DETAIL"
(
    "RD_DTLNO"         NUMBER NOT NULL ENABLE,
    "RM_NO"            NUMBER,
    "PO_DTLNO"         NUMBER,
    "ISD_NO"           NUMBER,
    "RD_RLOC"          NUMBER NOT NULL ENABLE,
    "RD_MDATE"         DATE NOT NULL ENABLE,
    "RD_ITEMCODE"      NUMBER NOT NULL ENABLE,
    "RD_QTY"           NUMBER DEFAULT 0.00,
    "CPU_RATE"         NUMBER,
    "MRATE"            NUMBER,
    "RD_REMARKS"       VARCHAR2 (300),
    "RD_BATCH_NO"      VARCHAR2 (12),
    "RD_EXPDT"         DATE,
    "ENTRY_USER"       VARCHAR2 (50),
    "ENTRY_USERPC"     VARCHAR2 (50),
    "ENTRY_DATE"       DATE DEFAULT SYSDATE,
    "UPDATE_USER"      VARCHAR2 (50),
    "UPDATE_USERPC"    VARCHAR2 (100),
    "UPDATE_DATE"      DATE,
    "RD_POST"          NUMBER DEFAULT 0,
    "RD_POUSER"        VARCHAR2 (10),
    "RD_PODATE"        DATE,
    "RD_POCOM"         VARCHAR2 (50),
    "VAT_SYN"          NUMBER DEFAULT 0,
    CONSTRAINT "RECEIPT_DETAIL_CON" PRIMARY KEY ("RD_DTLNO")
        USING INDEX ENABLE
);

ALTER TABLE "RECEIPT_DETAIL"
    ADD CONSTRAINT "RECEIPT_DETAIL_CON2" FOREIGN KEY ("RM_NO")
            REFERENCES "RECEIVE_MASTER" ("RM_NO")
            ENABLE;

ALTER TABLE "RECEIPT_DETAIL"
    ADD CONSTRAINT "RECEIPT_DETAIL_CON3" FOREIGN KEY ("RD_ITEMCODE")
            REFERENCES "FORMULATION_ITEM" ("ITEM_NO")
            ENABLE;
/



CREATE TABLE "RECEIVE_MASTER"
(
    "RM_NO"            NUMBER,
    "RM_MDATE"         DATE NOT NULL ENABLE,
    "RM_RLOC"          NUMBER NOT NULL ENABLE,
    "RM_ILOC"          NUMBER,
    "RM_SLCODE"        VARCHAR2 (20),
    "RM_RCVBY"         VARCHAR2 (10),
    "RM_PURTYP"        NUMBER (1, 0),
    "RM_BENO"          VARCHAR2 (20),
    "RM_BEDT"          DATE,
    "RM_CF_COMM"       NUMBER,
    "RM_PCT_REB"       NUMBER,
    "RM_DOC_FEE"       NUMBER,
    "RM_ITAX_CF"       NUMBER,
    "RM_PARTI"         VARCHAR2 (250),
    "RM_ITEM"          VARCHAR2 (16),
    "RM_FINE"          NUMBER (15, 2),
    "RM_BILLNO"        VARCHAR2 (25),
    "RM_BILLDT"        DATE,
    "RM_INVNO"         VARCHAR2 (25),
    "RM_IINVDT"        DATE,
    "RM_VATCHALLNO"    VARCHAR2 (30),
    "RM_VEHICLENO"     VARCHAR2 (30),
    "RM_BASEVAL"       NUMBER (17, 4),
    "RM_SUPPLDUTY"     NUMBER (17, 4),
    "RM_FREIGHT"       NUMBER (17, 4),
    "RM_OTHERS"        NUMBER (17, 4),
    "RM_DIS"           NUMBER (17, 4),
    "RM_VAT"           NUMBER (17, 4),
    "RM_ANCVAL"        NUMBER (17, 4),
    "RM_NETVAL"        NUMBER (17, 4),
    "RM_DUEDATE"       DATE,
    "APP_FLAG"         NUMBER DEFAULT 0,
    "APP_BY"           VARCHAR2 (7),
    "APP_DATE"         DATE,
    "ENTRY_USER"       VARCHAR2 (50),
    "ENTRY_USERPC"     VARCHAR2 (50),
    "ENTRY_DATE"       DATE DEFAULT SYSDATE NOT NULL ENABLE,
    "UPDATE_USER"      VARCHAR2 (50),
    "UPDATE_USERPC"    VARCHAR2 (100),
    "UPDATE_DATE"      DATE,
    CONSTRAINT "RECEIVE_MASTER_CON" PRIMARY KEY ("RM_NO") USING INDEX ENABLE
);
/

CREATE TABLE "SLS_ZONE_MASTER"
(
    "DIVISION_CODE"    VARCHAR2 (3),
    "DIVISION_NAME"    VARCHAR2 (100),
    "ZILLA_CODE"       VARCHAR2 (3),
    "ZILLA_NAME"       VARCHAR2 (100),
    "UPOZILLA_CODE"    VARCHAR2 (3),
    "UPOZILLA_NAME"    VARCHAR2 (100),
    "NEW_ZONE"         VARCHAR2 (15),
    CONSTRAINT "SLS_ZONEMST_NEWZONE_UN" UNIQUE ("NEW_ZONE")
        USING INDEX ENABLE,
    CONSTRAINT "SLS_ZONE_MST_ALL_UN" UNIQUE
        ("DIVISION_CODE", "ZILLA_CODE", "UPOZILLA_CODE")
        USING INDEX ENABLE
);
/


CREATE OR REPLACE FORCE VIEW "V_FOOD_ITEM"
(
    "ITEM_NO",
    "ITEM_NAME",
    "ITEM_DESC",
    "UOM_NO",
    "UOM_NAME",
    "CATEGORY_NO",
    "CATEGORY_NAME",
    "CATEGORY_DESC",
    "RATE"
)
AS
    SELECT F.ITEM_NO,
           F.ITEM_NAME,
           F.ITEM_DESC,
           F.UOM_NO,
           U.SHORT_NAME      UOM_NAME,
           F.CATEGORY_NO,
           C.CAT_NAME        CATEGORY_NAME,
           C.DESCRIPTION     CATEGORY_DESC,
           F.RATE
      FROM FOOD_ITEM F, IN_UOM U, FOOD_CATEGORY C
     WHERE F.UOM_NO = U.UOM_NO AND F.CATEGORY_NO = C.CAT_NO;
/


CREATE OR REPLACE FORCE VIEW "V_FOOD_ITEM_DETAIL"
(
    "SLNO",
    "ITEM_NO",
    "ITEM_NAME",
    "ITEM_DESC",
    "UOM_NO",
    "UOM_NAME",
    "CATEGORY_NO",
    "CATEGORY_NAME",
    "CATEGORY_DESC",
    "RATE",
    "FORMULA_ITEM_NO",
    "FORMULA_ITEM_NAME",
    "FORMULA_DESC",
    "FORMULA_UOMNO",
    "FORMULA_UOM",
    "QTY"
)
AS
    SELECT D.SLNO,
           M.ITEM_NO,
           M.ITEM_NAME,
           M.ITEM_DESC,
           M.UOM_NO,
           M.UOM_NAME,
           M.CATEGORY_NO,
           M.CATEGORY_NAME,
           M.CATEGORY_DESC,
           M.RATE,
           D.FORMULA_ITEM_NO,
           F.ITEM_NAME     FORMULA_ITEM_NAME,
           F.ITEM_DESC     FORMULA_DESC,
           F.UOM_NO        FORMULA_UOMNO,
           F.UOM_NAME      FORMULA_UOM,
           QTY
      FROM FOOD_ITEM_DETAIL D, V_FORMULATION_ITEM F, V_FOOD_ITEM M
     WHERE D.FORMULA_ITEM_NO = F.ITEM_NO AND D.ITEM_NO = M.ITEM_NO;
/



CREATE OR REPLACE FORCE VIEW "V_FORMULATION_ITEM"
(
    "ITEM_NO",
    "ITEM_NAME",
    "ITEM_DESC",
    "UOM_NO",
    "UOM_NAME"
)
AS
    SELECT F.ITEM_NO,
           F.ITEM_NAME,
           F.ITEM_DESC,
           F.UOM_NO,
           U.SHORT_NAME     UOM_NAME
      FROM FORMULATION_ITEM F, IN_UOM U
     WHERE F.UOM_NO = U.UOM_NO;
/



CREATE OR REPLACE FORCE VIEW "V_FORMULA_ITEM_AGANIST_INV"
(
    "ORD_MDATE",
    "ORD_RLOC",
    "FORMULA_ITEM_NO",
    "QTY"
)
AS
    SELECT ORD_MDATE,
           ORD_RLOC,
           FORMULA_ITEM_NO,
           QTY
      FROM (SELECT O.ORD_MDATE,
                   O.ORD_RLOC,
                   FD.FORMULA_ITEM_NO,
                   FD.QTY
              FROM ORDER_DETAIL O, FOOD_ITEM F, FOOD_ITEM_DETAIL FD
             WHERE O.ITEM_NO = F.ITEM_NO AND F.ITEM_NO = FD.ITEM_NO);
/


CREATE OR REPLACE FORCE VIEW "V_FORMULA_ITEM_RCV"
(
    "RD_MDATE",
    "RD_RLOC",
    "FORMULA_ITEM_NO",
    "RD_QTY"
)
AS
    SELECT RD_MDATE,
           RD_RLOC,
           RD_ITEMCODE     FORMULA_ITEM_NO,
           RD_QTY
      FROM RECEIPT_DETAIL;
/


CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_LOCATION"
(
    "LOC_CODE",
    "LOC_NAME",
    "LOC_DES",
    "LOC_TYPE",
    "LOC_TYPE_NAME"
)
AS
    SELECT LOC_CODE,
           LOC_NAME,
           LOC_DES,
           LOC_TYPE,
           DECODE (LOC_TYPE,  1, 'Shop',  2, 'Warehouse')     LOC_TYPE_NAME
      FROM LOCATION;
/


CREATE OR REPLACE FORCE VIEW "V_ORDER_DETAIL"
(
    "ORDER_DTLNO",
    "ORDER_NO",
    "ORD_MDATE",
    "ORD_RLOC",
    "ITEM_NO",
    "ITEM_NAME",
    "ITEM_DESC",
    "CATEGORY_NAME",
    "UOM_NO",
    "UOM_NAME",
    "QTY",
    "RATE",
    "AMOUNT"
)
AS
    SELECT D.ORDER_DTLNO,
           D.ORDER_NO,
           D.ORD_MDATE,
           D.ORD_RLOC,
           D.ITEM_NO,
           I.ITEM_NAME,
           I.ITEM_DESC,
           I.CATEGORY_NAME,
           I.UOM_NO,
           I.UOM_NAME,
           D.QTY,
           D.RATE,
           ROUND (D.QTY * D.RATE, 2)     AMOUNT
      FROM ORDER_DETAIL D, V_FOOD_ITEM I
     WHERE D.ITEM_NO = I.ITEM_NO;
/

CREATE OR REPLACE FORCE VIEW "V_ORDER_MASTER"
(
    "ORDER_NO",
    "ORDER_ID",
    "ORD_TRCODE",
    "ORD_FYEAR",
    "ORD_SERIALNO",
    "ORD_MDATE",
    "ORD_RLOC",
    "ORD_ILOC",
    "ORD_SLCODE",
    "SLNAME",
    "ORD_EMP",
    "ORD_DESADD",
    "ORD_DELIVERYPHNNO",
    "ORD_REMARKS",
    "ORD_PAYMODE",
    "PAY_MODE",
    "ORD_VAT",
    "ORD_TRANS",
    "ORD_GROSS",
    "ORD_DIS",
    "ORD_DIS_AMOUNT",
    "NET_AMOUNT",
    "PAID_AMOUNT"
)
AS
    SELECT ORDER_NO,
              ORD_TRCODE
           || '-'
           || ORD_RLOC
           || '/'
           || ORD_FYEAR
           || '/'
           || LPAD (ORD_SERIALNO, 4, 0)
               ORDER_ID,
           ORD_TRCODE,
           ORD_FYEAR,
           ORD_SERIALNO,
           ORD_MDATE,
           ORD_RLOC,
           ORD_ILOC,
           ORD_SLCODE,
           SLNAME,
           ORD_EMP,
           ORD_DESADD,
           ORD_DELIVERYPHNNO,
           ORD_REMARKS,
           ORD_PAYMODE,
           DECODE (ORD_PAYMODE,  1, 'Cash',  2, 'Card',  3, 'Bkash')
               PAY_MODE,
           ORD_VAT,
           ORD_TRANS,
           ORD_GROSS,
           ORD_DIS,
           NVL (ORD_GROSS, 0) * (NULLIF (ORD_DIS, 0) / 100)
               ORD_DIS_AMOUNT,
           NET_AMOUNT,
           PAID_AMOUNT
      FROM ORDER_MASTER O, GL_SL_CODE C
     WHERE O.ORD_SLCODE = C.SLCODE;
/


CREATE SEQUENCE "DEPT_SEQ" MINVALUE 1
                           MAXVALUE 9999999999999999999999999999
                           INCREMENT BY 1
                           START WITH 50
                           CACHE 20
                           NOORDER
                           NOCYCLE
                           NOKEEP
                           NOSCALE
                           GLOBAL;
/

CREATE SEQUENCE "EMP_SEQ" MINVALUE 1
                          MAXVALUE 9999999999999999999999999999
                          INCREMENT BY 1
                          START WITH 8000
                          CACHE 20
                          NOORDER
                          NOCYCLE
                          NOKEEP
                          NOSCALE
                          GLOBAL;
/


CREATE OR REPLACE FUNCTION FUN_GET_ORDMAS_SRNO (P_TRCD   IN VARCHAR2,
                                                P_LOC    IN NUMBER,
                                                P_DT     IN DATE)
    RETURN NUMBER
IS
    V_SR   NUMBER;
BEGIN
    SELECT NVL (MAX (ORD_SERIALNO), 0) + 1
      INTO V_SR
      FROM ORDER_MASTER
     WHERE     ORD_TRCODE = P_TRCD
           AND TO_CHAR (ORD_MDATE, 'MMRR') = TO_CHAR (P_DT, 'MMRR')
           AND ORD_RLOC = P_LOC;

    RETURN V_SR;
END;
/


CREATE OR REPLACE FUNCTION F_GET_PROD_SUBBODY (P_ITEM_NO NUMBER)
    RETURN VARCHAR2
IS
    RET_VAL   VARCHAR2 (32767);
BEGIN
    FOR I
        IN (SELECT (   RPAD (' #' || FORMULA_ITEM_NAME, 30, '_') || '__' || QTY || '(' || FORMULA_UOM || ')')    FORMULA_ITEM
              FROM V_FOOD_ITEM_DETAIL
             WHERE ITEM_NO = P_ITEM_NO)
    LOOP
        RET_VAL := RET_VAL || CHR (13) || I.FORMULA_ITEM;
    END LOOP;

    RETURN RET_VAL;
EXCEPTION
    WHEN OTHERS
    THEN
        -- Handle the exception appropriately, e.g., log it
        -- You can also return an error message here if needed
        DBMS_OUTPUT.PUT_LINE ('An error occurred: ' || SQLERRM);
        RETURN NULL;
END;
/


CREATE OR REPLACE FUNCTION SET_CUST_CODE (P_SLNAME VARCHAR2)
    RETURN VARCHAR2
IS
    V_SLCODE      VARCHAR2 (10);
    V_SLCODE_SL   NUMBER;
BEGIN
    V_SLCODE := 'C' || SUBSTR ( REGEXP_REPLACE (UPPER (P_SLNAME), '[/()$#@&`!?:;,."+-]|[0-9]| ', ''), 0, 3);

    SELECT NVL (MAX (TO_NUMBER (SUBSTR (SLCODE, 5))), 0) + 1
      INTO V_SLCODE_SL
      FROM GL_SL_CODE
     WHERE SUBSTR (SLCODE, 0, 4) = RPAD (V_SLCODE, 4, 'O');

    RETURN RPAD (V_SLCODE, 4, 'O') || V_SLCODE_SL;
END;
/


SET DEFINE OFF;
Insert into FOOD_CATEGORY
   (CAT_NO, CAT_NAME, DESCRIPTION)
 Values
   (1, 'Burger', NULL);
Insert into FOOD_CATEGORY
   (CAT_NO, CAT_NAME, DESCRIPTION)
 Values
   (3, 'Drinks', NULL);
Insert into FOOD_CATEGORY
   (CAT_NO, CAT_NAME, DESCRIPTION)
 Values
   (2, 'Fried Item', NULL);
COMMIT;
/


SET DEFINE OFF;
Insert into GL_SL_CODE
   (SLCODE, SLNAME, LOC_CODE, SRLOC, SLTYPE, 
    PARTY_TP, CODETYP, ADDR1, ADDR2, ADDR3, 
    ADDR4, CONTACT_PERSON, CONTACT_NO, CONTACT_ADDRESS, REGNO, 
    REGDATE, CONTACTP, TELEPHONE, FAXNO, EMAILNO, 
    MLINK, CASHDEPOT, ZILLA_CODE, UPOZILLA_CODE, TIN, 
    NID, STATUS, VAT_SYN, ENTRY_USER, ENTRY_USERPC, 
    ENTRY_DATE, UPDATE_USER, UPDATE_USERPC, UPDATE_DATE)
 Values
   ('CMRX01', 'Mr. X', 1, NULL, '1', 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, '01644398101', NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    TO_DATE('10/1/2023 9:11:31 PM', 'MM/DD/YYYY HH:MI:SS AM'), NULL, NULL, NULL);
Insert into GL_SL_CODE
   (SLCODE, SLNAME, LOC_CODE, SRLOC, SLTYPE, 
    PARTY_TP, CODETYP, ADDR1, ADDR2, ADDR3, 
    ADDR4, CONTACT_PERSON, CONTACT_NO, CONTACT_ADDRESS, REGNO, 
    REGDATE, CONTACTP, TELEPHONE, FAXNO, EMAILNO, 
    MLINK, CASHDEPOT, ZILLA_CODE, UPOZILLA_CODE, TIN, 
    NID, STATUS, VAT_SYN, ENTRY_USER, ENTRY_USERPC, 
    ENTRY_DATE, UPDATE_USER, UPDATE_USERPC, UPDATE_DATE)
 Values
   ('CSHW1', 'Dilder  Hossain', NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, '0123121111', NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, 0, NULL, NULL, 
    TO_DATE('10/1/2023 9:11:31 PM', 'MM/DD/YYYY HH:MI:SS AM'), NULL, NULL, NULL);
COMMIT;
/

SET DEFINE OFF;
Insert into IN_UOM
   (UOM_NO, UOM_NAME, SHORT_NAME, UNIT_QTY)
 Values
   (1, 'Pieces', 'PCS', 1);
Insert into IN_UOM
   (UOM_NO, UOM_NAME, SHORT_NAME, UNIT_QTY)
 Values
   (2, 'Gram', 'GM', 1);
Insert into IN_UOM
   (UOM_NO, UOM_NAME, SHORT_NAME, UNIT_QTY)
 Values
   (3, 'Milliliter', 'ML', 1);
COMMIT;
/


SET DEFINE OFF;
Insert into LOCATION
   (LOC_CODE, LOC_NAME, LOC_DES, LOC_TYPE)
 Values
   (2, 'Gulsan', NULL, 1);
Insert into LOCATION
   (LOC_CODE, LOC_NAME, LOC_DES, LOC_TYPE)
 Values
   (1, 'Banani', NULL, 1);
Insert into LOCATION
   (LOC_CODE, LOC_NAME, LOC_DES, LOC_TYPE)
 Values
   (3, 'Banani', NULL, 2);
Insert into LOCATION
   (LOC_CODE, LOC_NAME, LOC_DES, LOC_TYPE)
 Values
   (4, 'Gulsan', NULL, 2);
COMMIT;
/

SET DEFINE OFF;
Insert into FORMULATION_ITEM
   (ITEM_NO, ITEM_NAME, ITEM_DESC, UOM_NO)
 Values
   (7, 'Mayonnaise', NULL, 2);
Insert into FORMULATION_ITEM
   (ITEM_NO, ITEM_NAME, ITEM_DESC, UOM_NO)
 Values
   (6, 'Chicken Patty', NULL, 1);
Insert into FORMULATION_ITEM
   (ITEM_NO, ITEM_NAME, ITEM_DESC, UOM_NO)
 Values
   (3, 'Bun', NULL, 1);
Insert into FORMULATION_ITEM
   (ITEM_NO, ITEM_NAME, ITEM_DESC, UOM_NO)
 Values
   (1, 'Karaage Chicken', NULL, 1);
Insert into FORMULATION_ITEM
   (ITEM_NO, ITEM_NAME, ITEM_DESC, UOM_NO)
 Values
   (2, 'French Fry', NULL, 2);
Insert into FORMULATION_ITEM
   (ITEM_NO, ITEM_NAME, ITEM_DESC, UOM_NO)
 Values
   (5, 'Butter', NULL, 2);
Insert into FORMULATION_ITEM
   (ITEM_NO, ITEM_NAME, ITEM_DESC, UOM_NO)
 Values
   (4, 'Cheese Slice', NULL, 1);
Insert into FORMULATION_ITEM
   (ITEM_NO, ITEM_NAME, ITEM_DESC, UOM_NO)
 Values
   (8, 'Milk', NULL, 3);
Insert into FORMULATION_ITEM
   (ITEM_NO, ITEM_NAME, ITEM_DESC, UOM_NO)
 Values
   (9, 'Coffee Bean', NULL, 2);
COMMIT;
/


SET DEFINE OFF;
Insert into FOOD_ITEM
   (ITEM_NO, ITEM_NAME, ITEM_DESC, UOM_NO, CATEGORY_NO, 
    RATE, MIMETYPE)
 Values
   (4, 'Chicken Burger', 'Chicken Burger With French Fry', 1, 1, 
    240, 'image/jpeg');
Insert into FOOD_ITEM
   (ITEM_NO, ITEM_NAME, ITEM_DESC, UOM_NO, CATEGORY_NO, 
    RATE, MIMETYPE)
 Values
   (1, 'Fried Chicken', 'Fired Chicken with French Fry', 1, 2, 
    240, 'image/jpeg');
Insert into FOOD_ITEM
   (ITEM_NO, ITEM_NAME, ITEM_DESC, UOM_NO, CATEGORY_NO, 
    RATE, MIMETYPE)
 Values
   (3, 'Cappuccino', NULL, 1, 3, 
    210, 'image/jpeg');
COMMIT;
/


SET DEFINE OFF;
Insert into FOOD_ITEM_DETAIL
   (SLNO, ITEM_NO, FORMULA_ITEM_NO, QTY)
 Values
   (5, 4, 3, 1);
Insert into FOOD_ITEM_DETAIL
   (SLNO, ITEM_NO, FORMULA_ITEM_NO, QTY)
 Values
   (6, 4, 4, 1);
Insert into FOOD_ITEM_DETAIL
   (SLNO, ITEM_NO, FORMULA_ITEM_NO, QTY)
 Values
   (7, 4, 5, 30);
Insert into FOOD_ITEM_DETAIL
   (SLNO, ITEM_NO, FORMULA_ITEM_NO, QTY)
 Values
   (8, 4, 7, 30);
Insert into FOOD_ITEM_DETAIL
   (SLNO, ITEM_NO, FORMULA_ITEM_NO, QTY)
 Values
   (9, 4, 2, 80);
Insert into FOOD_ITEM_DETAIL
   (SLNO, ITEM_NO, FORMULA_ITEM_NO, QTY)
 Values
   (10, 4, 6, 1);
Insert into FOOD_ITEM_DETAIL
   (SLNO, ITEM_NO, FORMULA_ITEM_NO, QTY)
 Values
   (1, 1, 1, 5);
Insert into FOOD_ITEM_DETAIL
   (SLNO, ITEM_NO, FORMULA_ITEM_NO, QTY)
 Values
   (2, 1, 2, 80);
Insert into FOOD_ITEM_DETAIL
   (SLNO, ITEM_NO, FORMULA_ITEM_NO, QTY)
 Values
   (3, 3, 8, 140);
Insert into FOOD_ITEM_DETAIL
   (SLNO, ITEM_NO, FORMULA_ITEM_NO, QTY)
 Values
   (4, 3, 9, 9);
COMMIT;
/

SET DEFINE OFF;
Insert into RECEIVE_MASTER
   (RM_NO, RM_MDATE, RM_RLOC, RM_ILOC, RM_SLCODE, 
    RM_RCVBY, RM_PURTYP, RM_BENO, RM_BEDT, RM_CF_COMM, 
    RM_PCT_REB, RM_DOC_FEE, RM_ITAX_CF, RM_PARTI, RM_ITEM, 
    RM_FINE, RM_BILLNO, RM_BILLDT, RM_INVNO, RM_IINVDT, 
    RM_VATCHALLNO, RM_VEHICLENO, RM_BASEVAL, RM_SUPPLDUTY, RM_FREIGHT, 
    RM_OTHERS, RM_DIS, RM_VAT, RM_ANCVAL, RM_NETVAL, 
    RM_DUEDATE, APP_FLAG, APP_BY, APP_DATE, ENTRY_USER, 
    ENTRY_USERPC, ENTRY_DATE, UPDATE_USER, UPDATE_USERPC, UPDATE_DATE)
 Values
   (1, TO_DATE('9/20/2023', 'MM/DD/YYYY'), 1, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, 0, NULL, NULL, NULL, 
    NULL, TO_DATE('10/1/2023 9:08:54 PM', 'MM/DD/YYYY HH:MI:SS AM'), NULL, NULL, NULL);
COMMIT;
/

SET DEFINE OFF;
Insert into RECEIPT_DETAIL
   (RD_DTLNO, RM_NO, PO_DTLNO, ISD_NO, RD_RLOC, 
    RD_MDATE, RD_ITEMCODE, RD_QTY, CPU_RATE, MRATE, 
    RD_REMARKS, RD_BATCH_NO, RD_EXPDT, ENTRY_USER, ENTRY_USERPC, 
    ENTRY_DATE, UPDATE_USER, UPDATE_USERPC, UPDATE_DATE, RD_POST, 
    RD_POUSER, RD_PODATE, RD_POCOM, VAT_SYN)
 Values
   (3, 1, NULL, NULL, 1, 
    TO_DATE('9/20/2023', 'MM/DD/YYYY'), 4, 6500, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL);
Insert into RECEIPT_DETAIL
   (RD_DTLNO, RM_NO, PO_DTLNO, ISD_NO, RD_RLOC, 
    RD_MDATE, RD_ITEMCODE, RD_QTY, CPU_RATE, MRATE, 
    RD_REMARKS, RD_BATCH_NO, RD_EXPDT, ENTRY_USER, ENTRY_USERPC, 
    ENTRY_DATE, UPDATE_USER, UPDATE_USERPC, UPDATE_DATE, RD_POST, 
    RD_POUSER, RD_PODATE, RD_POCOM, VAT_SYN)
 Values
   (7, 1, NULL, NULL, 1, 
    TO_DATE('9/20/2023', 'MM/DD/YYYY'), 1, 340, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL);
Insert into RECEIPT_DETAIL
   (RD_DTLNO, RM_NO, PO_DTLNO, ISD_NO, RD_RLOC, 
    RD_MDATE, RD_ITEMCODE, RD_QTY, CPU_RATE, MRATE, 
    RD_REMARKS, RD_BATCH_NO, RD_EXPDT, ENTRY_USER, ENTRY_USERPC, 
    ENTRY_DATE, UPDATE_USER, UPDATE_USERPC, UPDATE_DATE, RD_POST, 
    RD_POUSER, RD_PODATE, RD_POCOM, VAT_SYN)
 Values
   (8, 1, NULL, NULL, 1, 
    TO_DATE('9/20/2023', 'MM/DD/YYYY'), 7, 8000, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL);
Insert into RECEIPT_DETAIL
   (RD_DTLNO, RM_NO, PO_DTLNO, ISD_NO, RD_RLOC, 
    RD_MDATE, RD_ITEMCODE, RD_QTY, CPU_RATE, MRATE, 
    RD_REMARKS, RD_BATCH_NO, RD_EXPDT, ENTRY_USER, ENTRY_USERPC, 
    ENTRY_DATE, UPDATE_USER, UPDATE_USERPC, UPDATE_DATE, RD_POST, 
    RD_POUSER, RD_PODATE, RD_POCOM, VAT_SYN)
 Values
   (2, 1, NULL, NULL, 1, 
    TO_DATE('9/20/2023', 'MM/DD/YYYY'), 5, 3000, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL);
Insert into RECEIPT_DETAIL
   (RD_DTLNO, RM_NO, PO_DTLNO, ISD_NO, RD_RLOC, 
    RD_MDATE, RD_ITEMCODE, RD_QTY, CPU_RATE, MRATE, 
    RD_REMARKS, RD_BATCH_NO, RD_EXPDT, ENTRY_USER, ENTRY_USERPC, 
    ENTRY_DATE, UPDATE_USER, UPDATE_USERPC, UPDATE_DATE, RD_POST, 
    RD_POUSER, RD_PODATE, RD_POCOM, VAT_SYN)
 Values
   (4, 1, NULL, NULL, 1, 
    TO_DATE('9/20/2023', 'MM/DD/YYYY'), 6, 600, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL);
Insert into RECEIPT_DETAIL
   (RD_DTLNO, RM_NO, PO_DTLNO, ISD_NO, RD_RLOC, 
    RD_MDATE, RD_ITEMCODE, RD_QTY, CPU_RATE, MRATE, 
    RD_REMARKS, RD_BATCH_NO, RD_EXPDT, ENTRY_USER, ENTRY_USERPC, 
    ENTRY_DATE, UPDATE_USER, UPDATE_USERPC, UPDATE_DATE, RD_POST, 
    RD_POUSER, RD_PODATE, RD_POCOM, VAT_SYN)
 Values
   (5, 1, NULL, NULL, 1, 
    TO_DATE('9/20/2023', 'MM/DD/YYYY'), 9, 6000, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL);
Insert into RECEIPT_DETAIL
   (RD_DTLNO, RM_NO, PO_DTLNO, ISD_NO, RD_RLOC, 
    RD_MDATE, RD_ITEMCODE, RD_QTY, CPU_RATE, MRATE, 
    RD_REMARKS, RD_BATCH_NO, RD_EXPDT, ENTRY_USER, ENTRY_USERPC, 
    ENTRY_DATE, UPDATE_USER, UPDATE_USERPC, UPDATE_DATE, RD_POST, 
    RD_POUSER, RD_PODATE, RD_POCOM, VAT_SYN)
 Values
   (1, 1, NULL, NULL, 1, 
    TO_DATE('9/20/2023', 'MM/DD/YYYY'), 3, 100, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL);
Insert into RECEIPT_DETAIL
   (RD_DTLNO, RM_NO, PO_DTLNO, ISD_NO, RD_RLOC, 
    RD_MDATE, RD_ITEMCODE, RD_QTY, CPU_RATE, MRATE, 
    RD_REMARKS, RD_BATCH_NO, RD_EXPDT, ENTRY_USER, ENTRY_USERPC, 
    ENTRY_DATE, UPDATE_USER, UPDATE_USERPC, UPDATE_DATE, RD_POST, 
    RD_POUSER, RD_PODATE, RD_POCOM, VAT_SYN)
 Values
   (9, 1, NULL, NULL, 1, 
    TO_DATE('9/20/2023', 'MM/DD/YYYY'), 8, 7000, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL);
Insert into RECEIPT_DETAIL
   (RD_DTLNO, RM_NO, PO_DTLNO, ISD_NO, RD_RLOC, 
    RD_MDATE, RD_ITEMCODE, RD_QTY, CPU_RATE, MRATE, 
    RD_REMARKS, RD_BATCH_NO, RD_EXPDT, ENTRY_USER, ENTRY_USERPC, 
    ENTRY_DATE, UPDATE_USER, UPDATE_USERPC, UPDATE_DATE, RD_POST, 
    RD_POUSER, RD_PODATE, RD_POCOM, VAT_SYN)
 Values
   (6, 1, NULL, NULL, 1, 
    TO_DATE('9/20/2023', 'MM/DD/YYYY'), 2, 2000, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL);
COMMIT;
/


SET DEFINE OFF;
Insert into ORDER_MASTER
   (ORDER_NO, ORD_TRCODE, ORD_FYEAR, ORD_SERIALNO, ORD_MDATE, 
    ORD_RLOC, ORD_ILOC, ORD_SLCODE, ORD_EMP, ORD_DESADD, 
    ORD_DELIVERYPHNNO, ORD_REMARKS, ORD_PAYMODE, ORD_VAT, ORD_TRANS, 
    ORD_GROSS, ORD_DIS, NET_AMOUNT, PAID_AMOUNT, PRINT_FLAG, 
    ENTRY_USER, ENTRY_USERPC, ENTRY_DATE, UPDATE_USER, UPDATE_USERPC, 
    UPDATE_DATE, VOID_FLAG, VOID_TYPE, VOID_REASON, VOID_BY, 
    VOID_DATE, VOID_REQ_BY, VOID_REQ_FROM)
 Values
   (1, 'SI', '23', 1, TO_DATE('9/23/2023', 'MM/DD/YYYY'), 
    1, NULL, 'CSHW1', NULL, NULL, 
    NULL, NULL, 1, NULL, NULL, 
    900, NULL, 900, NULL, 1, 
    NULL, NULL, TO_DATE('9/23/2023', 'MM/DD/YYYY'), NULL, NULL, 
    NULL, 0, 0, NULL, NULL, 
    NULL, NULL, NULL);
COMMIT;
/


SET DEFINE OFF;
Insert into ORDER_DETAIL
   (ORDER_DTLNO, ORDER_NO, ORD_MDATE, ORD_RLOC, ITEM_NO, 
    QTY, RATE, PROMO_DIS, OTHER_DIS, ENTRY_USER, 
    ENTRY_USERPC, ENTRY_DATE, UPDATE_USER, UPDATE_USERPC, UPDATE_DATE, 
    VOID_TYPE, VOID_QTY, VOID_REASON, VAT_SYN)
 Values
   (1, 1, TO_DATE('9/23/2023', 'MM/DD/YYYY'), 1, 4, 
    2, 240, NULL, NULL, NULL, 
    NULL, TO_DATE('9/23/2023 12:12:38 AM', 'MM/DD/YYYY HH:MI:SS AM'), NULL, NULL, NULL, 
    0, 0, NULL, 0);
Insert into ORDER_DETAIL
   (ORDER_DTLNO, ORDER_NO, ORD_MDATE, ORD_RLOC, ITEM_NO, 
    QTY, RATE, PROMO_DIS, OTHER_DIS, ENTRY_USER, 
    ENTRY_USERPC, ENTRY_DATE, UPDATE_USER, UPDATE_USERPC, UPDATE_DATE, 
    VOID_TYPE, VOID_QTY, VOID_REASON, VAT_SYN)
 Values
   (2, 1, TO_DATE('9/23/2023', 'MM/DD/YYYY'), 1, 3, 
    2, 210, NULL, NULL, NULL, 
    NULL, TO_DATE('9/23/2023 12:12:38 AM', 'MM/DD/YYYY HH:MI:SS AM'), NULL, NULL, NULL, 
    0, 0, NULL, 0);
COMMIT;
/


