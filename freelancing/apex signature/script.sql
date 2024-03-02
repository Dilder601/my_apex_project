#INSTRUCTION
#IDENTIFYING INFORMATION
#PREMEDICAL EDUCATION
#MEDICAL EDUCATION
#INTERNSHIP
#RESIDENCIES/FELLOWSHIPS
#BOARD CERTIFICATION
#MEDICAL LICENSURE/CERTIFICATES
#MEDICARE/MEDICAID REGISTRATION
#BLUE CROSS BLUE SHIELD REGISTRATION
#PROFESSIONAL LIABILITY
#List all of your professional liability carriers within the last 5 years, other than the one listed above

#PAST/PRESENT HOSPITAL AFFILIATIONS
#PEER REFERENCES
#WORK HISTORY
#QUESTIONS
#SIGNATURE


1.INSTRUCTION
2.IDENTIFYING
3.PREMEDICAL
4.MEDICAL
5.INTERNSHIP
6.RESIDENCIES
7.BOARD
8.LICENSURE
9.MEDICAID
10.BLUE
11.PROFESSIONAL
12.PAST
13.PEER
14.WORK
15.QUESTIONS
16.SIGNATURE

// function and global variable

$(document).ready(function() {
    $('#P9_SELECT_REGION').show();
    $('#INSTRUCTION').show();
    $('#IDENTIFYING').hide();
    $('#PREMEDICAL').hide();
    $('#MEDICAL').hide();
    $('#INTERNSHIP').hide();
    $('#RESIDENCIES').hide();
    $('#BOARD').hide();
    $('#LICENSURE').hide();
    $('#MEDICAID').hide();
    $('#BLUE').hide();
    $('#PROFESSIONAL').hide();
    $('#ALLPROFESSIONAL').hide();
    $('#PAST').hide();
    $('#PEER').hide();
    $('#WORK').hide();
    $('#QUESTIONS').hide();
    $('#IMGSIGNATURE').hide();

    $('#P9_SELECT_REGION').change(function () {
        if($v('P9_SELECT_REGION') == 'INSTRUCTION') {
            $('#INSTRUCTION').show();
            $('#IDENTIFYING').hide(); 
            $('#PREMEDICAL').hide(); 
            $('#MEDICAL').hide(); 
            $('#INTERNSHIP').hide(); 
            $('#RESIDENCIES').hide(); 
            $('#BOARD').hide(); 
            $('#LICENSURE').hide(); 
            $('#MEDICAID').hide(); 
            $('#BLUE').hide(); 
            $('#PROFESSIONAL').hide(); 
            $('#PAST').hide(); 
            $('#PEER').hide(); 
            $('#WORK').hide(); 
            $('#QUESTIONS').hide(); 
            $('#SIGNATURE').hide(); 
              
        } else if($v('P9_SELECT_REGION') == 'IDENTIFYING') {
           $('#INSTRUCTION').hide();
            $('#IDENTIFYING').show(); 
            $('#PREMEDICAL').hide(); 
            $('#MEDICAL').hide(); 
            $('#INTERNSHIP').hide(); 
            $('#RESIDENCIES').hide(); 
            $('#BOARD').hide(); 
            $('#LICENSURE').hide(); 
            $('#MEDICAID').hide(); 
            $('#BLUE').hide(); 
            $('#PROFESSIONAL').hide(); 
            $('#PAST').hide(); 
            $('#PEER').hide(); 
            $('#WORK').hide(); 
            $('#QUESTIONS').hide(); 
            $('#SIGNATURE').hide();  
        } else if($v('P9_SELECT_REGION') == 'PREMEDICAL') {
            $('#INSTRUCTION').hide();
            $('#IDENTIFYING').hide(); 
            $('#PREMEDICAL').show(); 
            $('#MEDICAL').hide(); 
            $('#INTERNSHIP').hide(); 
            $('#RESIDENCIES').hide(); 
            $('#BOARD').hide(); 
            $('#LICENSURE').hide(); 
            $('#MEDICAID').hide(); 
            $('#BLUE').hide(); 
            $('#PROFESSIONAL').hide(); 
            $('#PAST').hide(); 
            $('#PEER').hide(); 
            $('#WORK').hide(); 
            $('#QUESTIONS').hide(); 
            $('#SIGNATURE').hide();  
        }
        else if($v('P9_SELECT_REGION') == 'MEDICAL') {
            $('#INSTRUCTION').hide();
            $('#IDENTIFYING').hide(); 
            $('#PREMEDICAL').hide(); 
            $('#MEDICAL').show(); 
            $('#INTERNSHIP').hide(); 
            $('#RESIDENCIES').hide(); 
            $('#BOARD').hide(); 
            $('#LICENSURE').hide(); 
            $('#MEDICAID').hide(); 
            $('#BLUE').hide(); 
            $('#PROFESSIONAL').hide(); 
            $('#PAST').hide(); 
            $('#PEER').hide(); 
            $('#WORK').hide(); 
            $('#QUESTIONS').hide(); 
            $('#SIGNATURE').hide();  
        }
        else if($v('P9_SELECT_REGION') == 'INTERNSHIP') {
            $('#INSTRUCTION').hide();
            $('#IDENTIFYING').hide(); 
            $('#PREMEDICAL').hide(); 
            $('#MEDICAL').hide(); 
            $('#INTERNSHIP').show(); 
            $('#RESIDENCIES').hide(); 
            $('#BOARD').hide(); 
            $('#LICENSURE').hide(); 
            $('#MEDICAID').hide(); 
            $('#BLUE').hide(); 
            $('#PROFESSIONAL').hide(); 
            $('#PAST').hide(); 
            $('#PEER').hide(); 
            $('#WORK').hide(); 
            $('#QUESTIONS').hide(); 
            $('#SIGNATURE').hide();  
        }
        else if($v('P9_SELECT_REGION') == 'RESIDENCIES') {
            $('#INSTRUCTION').hide();
            $('#IDENTIFYING').hide(); 
            $('#PREMEDICAL').hide(); 
            $('#MEDICAL').hide(); 
            $('#INTERNSHIP').hide(); 
            $('#RESIDENCIES').show(); 
            $('#BOARD').hide(); 
            $('#LICENSURE').hide(); 
            $('#MEDICAID').hide(); 
            $('#BLUE').hide(); 
            $('#PROFESSIONAL').hide(); 
            $('#PAST').hide(); 
            $('#PEER').hide(); 
            $('#WORK').hide(); 
            $('#QUESTIONS').hide(); 
            $('#SIGNATURE').hide();  
        }
        else if($v('P9_SELECT_REGION') == 'BOARD') {
            $('#INSTRUCTION').hide();
            $('#IDENTIFYING').hide(); 
            $('#PREMEDICAL').hide(); 
            $('#MEDICAL').hide(); 
            $('#INTERNSHIP').hide(); 
            $('#RESIDENCIES').hide(); 
            $('#BOARD').show(); 
            $('#LICENSURE').hide(); 
            $('#MEDICAID').hide(); 
            $('#BLUE').hide(); 
            $('#PROFESSIONAL').hide(); 
            $('#PAST').hide(); 
            $('#PEER').hide(); 
            $('#WORK').hide(); 
            $('#QUESTIONS').hide(); 
            $('#SIGNATURE').hide();  
        }
        else if($v('P9_SELECT_REGION') == 'LICENSURE') {
            $('#INSTRUCTION').hide();
            $('#IDENTIFYING').hide(); 
            $('#PREMEDICAL').hide(); 
            $('#MEDICAL').hide(); 
            $('#INTERNSHIP').hide(); 
            $('#RESIDENCIES').hide(); 
            $('#BOARD').hide(); 
            $('#LICENSURE').show(); 
            $('#MEDICAID').hide(); 
            $('#BLUE').hide(); 
            $('#PROFESSIONAL').hide(); 
            $('#PAST').hide(); 
            $('#PEER').hide(); 
            $('#WORK').hide(); 
            $('#QUESTIONS').hide(); 
            $('#SIGNATURE').hide();  
        }
        else if($v('P9_SELECT_REGION') == 'MEDICAID') {
            $('#INSTRUCTION').hide();
            $('#IDENTIFYING').hide(); 
            $('#PREMEDICAL').hide(); 
            $('#MEDICAL').hide(); 
            $('#INTERNSHIP').hide(); 
            $('#RESIDENCIES').hide(); 
            $('#BOARD').hide(); 
            $('#LICENSURE').hide(); 
            $('#MEDICAID').show(); 
            $('#BLUE').hide(); 
            $('#PROFESSIONAL').hide(); 
            $('#PAST').hide(); 
            $('#PEER').hide(); 
            $('#WORK').hide(); 
            $('#QUESTIONS').hide(); 
            $('#SIGNATURE').hide();  
        }
        else if($v('P9_SELECT_REGION') == 'BLUE') {
            $('#INSTRUCTION').hide();
            $('#IDENTIFYING').hide(); 
            $('#PREMEDICAL').hide(); 
            $('#MEDICAL').hide(); 
            $('#INTERNSHIP').hide(); 
            $('#RESIDENCIES').hide(); 
            $('#BOARD').hide(); 
            $('#LICENSURE').hide(); 
            $('#MEDICAID').hide(); 
            $('#BLUE').show(); 
            $('#PROFESSIONAL').hide(); 
            $('#PAST').hide(); 
            $('#PEER').hide(); 
            $('#WORK').hide(); 
            $('#QUESTIONS').hide(); 
            $('#SIGNATURE').hide();  
        }
        else if($v('P9_SELECT_REGION') == 'PROFESSIONAL') {
            $('#INSTRUCTION').hide();
            $('#IDENTIFYING').hide(); 
            $('#PREMEDICAL').hide(); 
            $('#MEDICAL').hide(); 
            $('#INTERNSHIP').hide(); 
            $('#RESIDENCIES').hide(); 
            $('#BOARD').hide(); 
            $('#LICENSURE').hide(); 
            $('#MEDICAID').hide(); 
            $('#BLUE').hide(); 
            $('#PROFESSIONAL').show(); 
            $('#ALLPROFESSIONAL').show(); 
            $('#PAST').hide(); 
            $('#PEER').hide(); 
            $('#WORK').hide(); 
            $('#QUESTIONS').hide(); 
            $('#SIGNATURE').hide();  
        }
        else if($v('P9_SELECT_REGION') == 'PAST') {
            $('#INSTRUCTION').hide();
            $('#IDENTIFYING').hide(); 
            $('#PREMEDICAL').hide(); 
            $('#MEDICAL').hide(); 
            $('#INTERNSHIP').hide(); 
            $('#RESIDENCIES').hide(); 
            $('#BOARD').hide(); 
            $('#LICENSURE').hide(); 
            $('#MEDICAID').hide(); 
            $('#BLUE').hide(); 
            $('#PROFESSIONAL').hide(); 
            $('#PAST').show(); 
            $('#PEER').hide(); 
            $('#WORK').hide(); 
            $('#QUESTIONS').hide(); 
            $('#SIGNATURE').hide();  
        }
        else if($v('P9_SELECT_REGION') == 'PEER') {
            $('#INSTRUCTION').hide();
            $('#IDENTIFYING').hide(); 
            $('#PREMEDICAL').hide(); 
            $('#MEDICAL').hide(); 
            $('#INTERNSHIP').hide(); 
            $('#RESIDENCIES').hide(); 
            $('#BOARD').hide(); 
            $('#LICENSURE').hide(); 
            $('#MEDICAID').hide(); 
            $('#BLUE').hide(); 
            $('#PROFESSIONAL').hide(); 
            $('#PAST').hide(); 
            $('#PEER').show(); 
            $('#WORK').hide(); 
            $('#QUESTIONS').hide(); 
            $('#SIGNATURE').hide();  
        }
        else if($v('P9_SELECT_REGION') == 'WORK') {
            $('#INSTRUCTION').hide();
            $('#IDENTIFYING').hide(); 
            $('#PREMEDICAL').hide(); 
            $('#MEDICAL').hide(); 
            $('#INTERNSHIP').hide(); 
            $('#RESIDENCIES').hide(); 
            $('#BOARD').hide(); 
            $('#LICENSURE').hide(); 
            $('#MEDICAID').hide(); 
            $('#BLUE').hide(); 
            $('#PROFESSIONAL').hide(); 
            $('#PAST').hide(); 
            $('#PEER').hide(); 
            $('#WORK').show(); 
            $('#QUESTIONS').hide(); 
            $('#SIGNATURE').hide();  
        }
        else if($v('P9_SELECT_REGION') == 'QUESTIONS') {
            $('#INSTRUCTION').hide();
            $('#IDENTIFYING').hide(); 
            $('#PREMEDICAL').hide(); 
            $('#MEDICAL').hide(); 
            $('#INTERNSHIP').hide(); 
            $('#RESIDENCIES').hide(); 
            $('#BOARD').hide(); 
            $('#LICENSURE').hide(); 
            $('#MEDICAID').hide(); 
            $('#BLUE').hide(); 
            $('#PROFESSIONAL').hide(); 
            $('#PAST').hide(); 
            $('#PEER').hide(); 
            $('#WORK').hide(); 
            $('#QUESTIONS').show(); 
            $('#SIGNATURE').hide();  
        }
        else if($v('P9_SELECT_REGION') == 'SIGNATURE') {
            $('#INSTRUCTION').hide();
            $('#IDENTIFYING').hide(); 
            $('#PREMEDICAL').hide(); 
            $('#MEDICAL').hide(); 
            $('#INTERNSHIP').hide(); 
            $('#RESIDENCIES').hide(); 
            $('#BOARD').hide(); 
            $('#LICENSURE').hide(); 
            $('#MEDICAID').hide(); 
            $('#BLUE').hide(); 
            $('#PROFESSIONAL').hide(); 
            $('#PAST').hide(); 
            $('#PEER').hide(); 
            $('#WORK').hide(); 
            $('#QUESTIONS').hide(); 
            $('#SIGNATURE').show();  
            $('#IMGSIGNATURE').show();  
        }
    });
});


select c001         file_name,  
        c002        file_type,  
        d001        upload_date,  
        blob001     file_download
from apex_collections where collection_name = 'APEX_SIGNATURE'


  CREATE TABLE "TMS_CREDENTIAL_PROVIDER_INFO" 
   (	"CRIF_ID" NUMBER, 
	"INSTRUCTIONS" CLOB, 
	"LAST_NAME" VARCHAR2(255), 
	"FIRST_NAME" VARCHAR2(255), 
	"MIDDLE" VARCHAR2(255), 
	"OTHER_NAMES_YOU_HAVE_USED" VARCHAR2(255), 
	"START_DATE_WITH_GROUP" DATE, 
	"HOME_ADDRESS" VARCHAR2(255), 
	"H_CITY" VARCHAR2(155), 
	"H_STATE" VARCHAR2(55), 
	"H_ZIP" NUMBER(7,0), 
	"HOME_TELEPHONE_NUMBER" VARCHAR2(12), 
	"HOME_FAX_NUMBER" VARCHAR2(12), 
	"PAGER_NUMBER" VARCHAR2(12), 
	"EMAIL_ADDRESS" VARCHAR2(155), 
	"MARRIED" VARCHAR2(1), 
	"SPOUSE_NAME" VARCHAR2(255), 
	"OFFICE_ADDRSS" VARCHAR2(255), 
	"OFICE_CITY" VARCHAR2(255), 
	"OFFICE_STATE" VARCHAR2(55), 
	"OFFICE_ZIP" NUMBER(7,0), 
	"OFFICE_TELEPHONE_NUMBER" VARCHAR2(12), 
	"OFFICE_TELEPHONE_EXTENSION" NUMBER(5,0), 
	"OFFICE_FAX_NUMBER" VARCHAR2(12), 
	"OFFICE_CONTACT" VARCHAR2(255), 
	"BIRTH_DATE" DATE, 
	"BIRTH_PLACE" CLOB, 
	"CITIZENSHIP" VARCHAR2(1000), 
	"SOCIAL_SECURITY_NUMBER" VARCHAR2(12), 
	"GENDER" VARCHAR2(12), 
	"RACE_ETHNICITY" VARCHAR2(255), 
	"LANGUAGES_SPOKEN" VARCHAR2(255), 
	"SPECIALITY" VARCHAR2(255), 
	"SUB_SPECIALITY" VARCHAR2(255), 
	"PREMEDICAL_COLLEGE_UNIVERSITY" VARCHAR2(255), 
	"PREMEDICAL_DEGREE_RECEIVED" VARCHAR2(255), 
	"PREMEDICAL_FROM_DATE" DATE, 
	"PREMEDICAL_TO_DATE" DATE, 
	"PREMEDICAL_MAILING_ADDRESS" CLOB, 
	"PREMEDICAL_CITY" VARCHAR2(155), 
	"PREMEDICAL_STATE" VARCHAR2(55), 
	"PREMEDICAL_ZIP" NUMBER(5,0), 
	"MEDICAL_EDUCATION_SCHOOL" VARCHAR2(255), 
	"MEDICAL_EDUCATION_DEGREE_RECEIVED" VARCHAR2(255), 
	"MEDICAL_EDUCATION_FROM_DATE" DATE, 
	"MEDICAL_EDUCATION_TO_DATE" DATE, 
	"MEDICAL_EDUCATION_ADDRESS" VARCHAR2(255), 
	"MEDICAL_EDUCATION_CITY" VARCHAR2(255), 
	"MEDICAL_EDUCATION_STATE" VARCHAR2(55), 
	"MEDICAL_EDUCATION_ZIP" VARCHAR2(5), 
	"INTERSHIP_INSTITUTION" VARCHAR2(255), 
	"INTERNSHIP_PROGRAM_DIRECTOR" VARCHAR2(255), 
	"INTERNSHIP_MAILING_ADDRESS" VARCHAR2(255), 
	"INTERNSHIP_CITY" VARCHAR2(255), 
	"INTERNSHIP_STATE" VARCHAR2(55), 
	"INTERNSHIP_ZIP" VARCHAR2(5), 
	"INTERSHIP_TYPE_OF_INTERNSHIP" VARCHAR2(1000), 
	"INTERNSHIP_SPECIALITY" VARCHAR2(255), 
	"INTERNSHIP_FROM" DATE, 
	"INTERNSHIP_TO" DATE, 
	"RESIDIENCE_FELLOWSHIPS_INSTITUTION" VARCHAR2(255), 
	"RESIDENCE_FELLOWSHIPS_PROGRAM_DIRECTOR" VARCHAR2(255), 
	"RESIDENCE_FELLOWHIPS_CITY" VARCHAR2(155), 
	"RESIDENCE_FELLOWSHIPS_STATE" VARCHAR2(55), 
	"RESIDENCE_FELLOWSHIPS_ZIP" VARCHAR2(55), 
	"RESIDENCE_FELLOWSHIPS_TRAINING_TYPE" VARCHAR2(255), 
	"RESIDENCE_FELLOWSHIPS_SPECIALITY" VARCHAR2(255), 
	"RESIDENCE_FELLOWSHIPS_FROM" DATE, 
	"RESIDENCE_FELLOWSHIPS_TO" DATE, 
	"RESIDENCE_FELLOWSHIPS_PROGRAM_COMPLETED" VARCHAR2(1), 
	"RESIDENCE_FELLOWSHIPS_PROGRAM_COMPLETED_NO_EXPLANATION" VARCHAR2(1000), 
	"RESIDIENCEFELLOWSHIPS_INSTITUTION_2" VARCHAR2(255), 
	"RESIDENCE_FELLOWSHIPS_PROGRAM_DIRECTOR_2" VARCHAR2(255), 
	"RESIDENCE_FELLOWSHIP_MAILING_ADDRESS_2" VARCHAR2(255), 
	"RESIDENCE_FELLOWHIPS_CITY_2" VARCHAR2(155), 
	"RESIDENCE_FELLOWSHIPS_STATE_2" VARCHAR2(55), 
	"RESIDENCE_FELLOWSHIPS_ZIP_2" VARCHAR2(55), 
	"RESIDENCE_FELLOWSHIPS_TRAINING_TYPE_2" VARCHAR2(255), 
	"RESIDENCE_FELLOWSHIPS_SPECIALITY_2" VARCHAR2(255), 
	"RESIDENCE_FELLOWSHIPS_FROM_2" DATE, 
	"RESIDENCE_FELLOWSHIPS_TO_2" DATE, 
	"RESIDENCE_FELLOWSHIPS_PROGRAM_COMPLETED_2" VARCHAR2(1), 
	"RESIDENCE_FELLOWSHIPS_PROGRAM_COMPLETED_NO_EXPLANATION_2" VARCHAR2(255), 
	"RESIDIENCEFELLOWSHIPS_INSTITUTION_3" VARCHAR2(255), 
	"RESIDENCE_FELLOWSHIPS_PROGRAM_DIRECTOR_3" VARCHAR2(255), 
	"RESIDENCE_FELLOWSHIP_MAILING_ADDRESS_3" VARCHAR2(255), 
	"RESIDENCE_FELLOWHIPS_CITY_3" VARCHAR2(155), 
	"RESIDENCE_FELLOWSHIPS_STATE_3" VARCHAR2(55), 
	"RESIDENCE_FELLOWSHIPS_ZIP_3" VARCHAR2(55), 
	"RESIDENCE_FELLOWSHIPS_TRAINING_TYPE_3" VARCHAR2(255), 
	"RESIDENCE_FELLOWSHIPS_SPECIALITY_3" VARCHAR2(255), 
	"RESIDENCE_FELLOWSHIPS_FROM_3" DATE, 
	"RESIDENCE_FELLOWSHIPS_TO_3" DATE, 
	"RESIDENCE_FELLOWSHIPS_PROGRAM_COMPLETED_3" VARCHAR2(1), 
	"RESIDENCE_FELLOWSHIPS_PROGRAM_COMPLETED_NO_EXPLANATION_3" VARCHAR2(255), 
	"RESIDIENCE_FELLOWSHIPS_INSTITUTION_4" VARCHAR2(255), 
	"RESIDENCE_FELLOWSHIPS_PROGRAM_DIRECTOR_4" VARCHAR2(255), 
	"RESIDENCE_FELLOWSHIP_MAILING_ADDRESS_4" VARCHAR2(255), 
	"RESIDENCE_FELLOWHIPS_CITY_4" VARCHAR2(155), 
	"RESIDENCE_FELLOWSHIPS_STATE_4" VARCHAR2(55), 
	"RESIDENCE_FELLOWSHIPS_ZIP_4" VARCHAR2(55), 
	"RESIDENCE_FELLOWSHIPS_TRAINING_TYPE_4" VARCHAR2(255), 
	"RESIDENCE_FELLOWSHIPS_SPECIALITY_4" VARCHAR2(255), 
	"RESIDENCE_FELLOWSHIPS_FROM_4" DATE, 
	"RESIDENCE_FELLOWSHIPS_TO_4" DATE, 
	"RESIDENCE_FELLOWSHIPS_PROGRAM_COMPLETED_4" VARCHAR2(1), 
	"RESIDENCE_FELLOWSHIPS_PROGRAM_COMPLETED_NO_EXPLANATION_4" VARCHAR2(1000), 
	"BOARD_CERTIFICATION_ISSUING_BOARD" VARCHAR2(255), 
	"BOARD_CERTIFICATION_SPECIALITY" VARCHAR2(255), 
	"BOARD_CERTIFICATION_DATE_CERTIFIED_RECERTIFIED" DATE, 
	"BOARD_CERTIFICATION_EXP_DATE" DATE, 
	"BOARD_CERTIFICATION_ISSUING_BOARD_2" VARCHAR2(255), 
	"BOARD_CERTIFICATION_SPECIALITY_2" VARCHAR2(255), 
	"BOARD_CERTIFICATION_DATE_CERTIFIED_RECERTIFIED_2" DATE, 
	"BOARD_CERTIFICATION_EXP_DATE_2" DATE, 
	"BOARD_CERTIFICATION_ISSUING_BOARD_3" VARCHAR2(255), 
	"BOARD_CERTIFICATION_SPECIALITY_3" VARCHAR2(255), 
	"BOARD_CERTIFICATION_DATE_CERTIFIED_RECERTIFIED_3" DATE, 
	"BOARD_CERTIFICATION_EXP_DATE_3" DATE, 
	"BOARD_CERTIFICATION_IF_NOT_CERTIFIED_DISCLAIMER" CLOB, 
	"MEDICAL_LICENSURES_CERTIFICATES_SM_LICENSE_NUMBER" VARCHAR2(25), 
	"MEDICAL_LICENSURES_CERTIFICATES_ISSUING_STATE" VARCHAR2(55), 
	"MEDICAL_LICENSURES_CERTIFICATES_DATE_ISSUED" DATE, 
	"MEDICAL_LICENSURES_CERTIFICATES_EXP_DATE" DATE, 
	"MEDICAL_LICENSURES_CERTIFICATES_SM_LICENSE_NUMBER_2" VARCHAR2(25), 
	"MEDICAL_LICENSURES_CERTIFICATES_ISSUING_STATE_2" VARCHAR2(55), 
	"MEDICAL_LICENSURES_CERTIFICATES_DATE_ISSUED_2" DATE, 
	"MEDICAL_LICENSURES_CERTIFICATES_EXP_DATE_2" DATE, 
	"MEDICAL_LICENSURES_CERTIFICATES_SM_LICENSE_NUMBER_3" VARCHAR2(25), 
	"MEDICAL_LICENSURES_CERTIFICATES_ISSUING_STATE_3" VARCHAR2(55), 
	"MEDICAL_LICENSURES_CERTIFICATES_DATE_ISSUED_3" DATE, 
	"MEDICAL_LICENSURES_CERTIFICATES_EXP_DATE_3" DATE, 
	"MEDICAL_LICENSURES_CERTIFICATES_DEA_CERTIFICATE_NUMBER" VARCHAR2(25), 
	"MEDICAL_LICENSURES_CERTIFICATES_DEA_CERTIFICATE_NUMBER_EXP_DATE" DATE, 
	"MEDICAL_LICENSURES_CERTIFICATES_SC_NUMBER_CONTROLLED_SUBSTANCE" VARCHAR2(25), 
	"MEDICAL_LICENSURES_CERTIFICATES_SC_NUMBER_CONTROLLED_SUBSTANCE_EXP_DATE" DATE, 
	"MEDICAL_LICENSURES_CERTIFICATES_ECFMG_NUMBER" VARCHAR2(25), 
	"MEDICAL_LICENSURES_CERTIFICATES_ECFMG_DATE_ISSUED" DATE, 
	"MEDICAL_LICENSURES_CERTIFICATES_ECFMG_EXP_DATE" DATE, 
	"MEDICARE_MEDICAID_PROVIDER_NUMBER_1" VARCHAR2(25), 
	"MEDICARE_MEDICAID_ISSUING_STATE_1" VARCHAR2(255), 
	"MEDICARE_MEDICAID_PROVIDER_NUMBER_2" VARCHAR2(25), 
	"MEDICARE_MEDICAID_ISSUING_STATE_2" VARCHAR2(255), 
	"MEDICARE_MEDICAID_PECOS_REGISTRATION_USERNAME" VARCHAR2(55), 
	"MEDICARE_MEDICAID_PECOS_REGISTRATION_PASSWORD" VARCHAR2(25), 
	"MEDICARE_MEDICAID_NPI_NUMBER" VARCHAR2(25), 
	"MEDICARE_MEDICAID_CAQH_USERNAME" VARCHAR2(25), 
	"MEDICARE_MEDICAID_CAQH_PASSWORD" VARCHAR2(25), 
	"MEDICARE_MEDICAID_NPPES_USERNAME" VARCHAR2(55), 
	"MEDICARE_MEDICAID_NPPES_PASSWORD" VARCHAR2(25), 
	"BLUE_CROSS_BLUE_SHIELD_INDIV_PROVIDER_NUMBER" VARCHAR2(25), 
	"BLUE_CROSS_BLUE_SHIELD_GROUP_NUMBER" VARCHAR2(25), 
	"PROFESSIONAL_LIABILITY_INS_CARRIER" VARCHAR2(255), 
	"PROFESSIONAL_LIABILITY_POLICY_NUMBER" VARCHAR2(55), 
	"PROFESSIONAL_LIABILITY_EFFECTIVE_DATE" DATE, 
	"PROFESSIONAL_LIABILITY_PER_CLAIM_AMOUNT" VARCHAR2(25), 
	"PROFESSIONAL_LIABILITY_AGGREGATE_AMOUNT" VARCHAR2(25), 
	"PROFESSIONAL_LIABILITY_EXP_DATE" DATE, 
	"PROFESSIONAL_LIABILITY_DISCLAIMER" CLOB, 
	"PROFESSIONA_LIABILITY_CARRIER_NAME" VARCHAR2(255), 
	"PROFESSIONA_LIABILITY_CARRIER_POLICY_NUMBER" VARCHAR2(25), 
	"PROFESSIONA_LIABILITY_CARRIER_FROM_DATE" DATE, 
	"PROFESSIONA_LIABILITY_CARRIER_IO_DATE" DATE, 
	"PROFESSIONA_LIABILITY_CARRIER_MAILING_ADDRESS" VARCHAR2(255), 
	"PROFESSIONA_LIABILITY_CARRIER_CITY" VARCHAR2(55), 
	"PROFESSIONA_LIABILITY_CARRIER_STATE" VARCHAR2(55), 
	"PROFESSIONA_LIABILITY_CARRIER_ZIP" NUMBER(5,0), 
	"PROFESSIONA_LIABILITY_CARRIER_NAME_2" VARCHAR2(255), 
	"PROFESSIONA_LIABILITY_CARRIER_POLICY_NUMBER_2" VARCHAR2(25), 
	"PROFESSIONA_LIABILITY_CARRIER_FROM_DATE_2" DATE, 
	"PROFESSIONA_LIABILITY_CARRIER_IO_DATE_2" DATE, 
	"PROFESSIONA_LIABILITY_CARRIER_MAILING_ADDRESS_2" VARCHAR2(255), 
	"PROFESSIONA_LIABILITY_CARRIER_CITY_2" VARCHAR2(55), 
	"PROFESSIONA_LIABILITY_CARRIER_STATE_2" VARCHAR2(55), 
	"PROFESSIONA_LIABILITY_CARRIER_ZIP_2" NUMBER(5,0), 
	"PROFESSIONA_LIABILITY_CARRIER_NAME_3" VARCHAR2(255), 
	"PROFESSIONA_LIABILITY_CARRIER_POLICY_NUMBER_3" VARCHAR2(25), 
	"PROFESSIONA_LIABILITY_CARRIER_FROM_DATE_3" DATE, 
	"PROFESSIONA_LIABILITY_CARRIER_IO_DATE_3" DATE, 
	"PROFESSIONA_LIABILITY_CARRIER_MAILING_ADDRESS_3" VARCHAR2(255), 
	"PROFESSIONA_LIABILITY_CARRIER_CITY_3" VARCHAR2(55), 
	"PROFESSIONA_LIABILITY_CARRIER_STATE_3" VARCHAR2(55), 
	"PROFESSIONA_LIABILITY_CARRIER_ZIP_3" NUMBER(5,0), 
	"PROFESSIONA_LIABILITY_CARRIER_NAME_4" VARCHAR2(255), 
	"PROFESSIONA_LIABILITY_CARRIER_POLICY_NUMBER_4" VARCHAR2(25), 
	"PROFESSIONA_LIABILITY_CARRIER_FROM_DATE_4" DATE, 
	"PROFESSIONA_LIABILITY_CARRIER_IO_DATE_4" DATE, 
	"PROFESSIONA_LIABILITY_CARRIER_MAILING_ADDRESS_4" VARCHAR2(255), 
	"PROFESSIONA_LIABILITY_CARRIER_CITY_4" VARCHAR2(55), 
	"PROFESSIONA_LIABILITY_CARRIER_STATE_4" VARCHAR2(55), 
	"PROFESSIONA_LIABILITY_CARRIER_ZIP_4" NUMBER(5,0), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_PRIMARY_ADMITTING_HOSPITAL" VARCHAR2(255), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_MAILING_ADDRESS" VARCHAR2(255), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_CITY" VARCHAR2(55), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_STATE" VARCHAR2(55), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_ZIP" VARCHAR2(5), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_DEPARTMENT_STATUS" VARCHAR2(25), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_APPOINTMENT_DATE" DATE, 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_PRIMARY_ADMITTING_HOSPITAL_2" VARCHAR2(255), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_MAILING_ADDRESS_2" VARCHAR2(255), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_CITY_2" VARCHAR2(55), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_STATE_2" VARCHAR2(55), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_ZIP_2" VARCHAR2(5), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_DEPARTMENT_STATUS_2" VARCHAR2(25), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_APPOINTMENT_DATE_2" DATE, 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_PRIMARY_ADMITTING_HOSPITAL_3" VARCHAR2(255), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_MAILING_ADDRESS_3" VARCHAR2(255), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_CITY_3" VARCHAR2(55), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_STATE_3" VARCHAR2(55), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_ZIP_3" VARCHAR2(5), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_DEPARTMENT_STATUS_3" VARCHAR2(25), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_APPOINTMENT_DATE_3" DATE, 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_PRIMARY_ADMITTING_HOSPITAL_4" VARCHAR2(255), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_MAILING_ADDRESS_4" VARCHAR2(255), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_CITY_4" VARCHAR2(55), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_STATE_4" VARCHAR2(55), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_ZIP_4" VARCHAR2(5), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_DEPARTMENT_STATUS_4" VARCHAR2(25), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_APPOINTMENT_DATE_4" DATE, 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_PRIMARY_ADMITTING_HOSPITAL_5" VARCHAR2(255), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_MAILING_ADDRESS_5" VARCHAR2(255), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_CITY_5" VARCHAR2(55), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_STATE_5" VARCHAR2(55), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_ZIP_5" VARCHAR2(5), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_DEPARTMENT_STATUS_5" VARCHAR2(25), 
	"PAST_PRESENT_HOSPITAL_AFFILIATIONS_APPOINTMENT_DATE_5" DATE, 
	"PEER_REFERENCES_NAME" VARCHAR2(255), 
	"PEER_REFERENCES_SPECIALITY" VARCHAR2(255), 
	"PEER_REFERENCES_TELEPHONE_NUMBER" VARCHAR2(12), 
	"PEER_REFERENCES_MAILING_ADDRESS" VARCHAR2(255), 
	"PEER_REFERENCES_CITY" VARCHAR2(55), 
	"PEER_REFERENCES_STATE" VARCHAR2(55), 
	"PEER_REFERENCES_ZIP" VARCHAR2(5), 
	"PEER_REFERENCES_RELATIONSHIP" VARCHAR2(255), 
	"PEER_REFERENCES_YEARS_KNOWN" VARCHAR2(2), 
	"PEER_REFERENCES_NAME_2" VARCHAR2(255), 
	"PEER_REFERENCES_SPECIALITY_2" VARCHAR2(255), 
	"PEER_REFERENCES_TELEPHONE_NUMBER_2" VARCHAR2(12), 
	"PEER_REFERENCES_MAILING_ADDRESS_2" VARCHAR2(255), 
	"PEER_REFERENCES_CITY_2" VARCHAR2(55), 
	"PEER_REFERENCES_STATE_2" VARCHAR2(55), 
	"PEER_REFERENCES_ZIP_2" VARCHAR2(5), 
	"PEER_REFERENCES_RELATIONSHIP_2" VARCHAR2(255), 
	"PEER_REFERENCES_YEARS_KNOWN_2" VARCHAR2(2), 
	"PEER_REFERENCES_NAME_3" VARCHAR2(255), 
	"PEER_REFERENCES_SPECIALITY_3" VARCHAR2(255), 
	"PEER_REFERENCES_TELEPHONE_NUMBER_3" VARCHAR2(12), 
	"PEER_REFERENCES_MAILING_ADDRESS_3" VARCHAR2(255), 
	"PEER_REFERENCES_CITY_3" VARCHAR2(55), 
	"PEER_REFERENCES_STATE_3" VARCHAR2(55), 
	"PEER_REFERENCES_ZIP_3" VARCHAR2(5), 
	"PEER_REFERENCES_RELATIONSHIP_3" VARCHAR2(255), 
	"PEER_REFERENCES_YEARS_KNOWN_3" VARCHAR2(2), 
	"WORK_HISTORY_DISCLAIMER" CLOB, 
	"WORK_HISTORY_CURRENT_PRACTICE" VARCHAR2(255), 
	"WORK_HISTORY_CONTACT" VARCHAR2(255), 
	"WORK_HISTORY_TELEPHONE_NUMBER" VARCHAR2(12), 
	"WORK_HISTORY_FAX" VARCHAR2(12), 
	"WORK_HISTORY_MAILING_ADDRESS" VARCHAR2(255), 
	"WORK_HISTORY_CITY" VARCHAR2(55), 
	"WORK_HISTORY_STATE" VARCHAR2(55), 
	"WORK_HISTORY_ZIP" NUMBER(5,0), 
	"WORK_HISTORY_FROM" VARCHAR2(5), 
	"WORK_HISTORY_TO" VARCHAR2(5), 
	"WORK_HISTORY_CURRENT_PRACTICE_2" VARCHAR2(255), 
	"WORK_HISTORY_CONTACT_2" VARCHAR2(255), 
	"WORK_HISTORY_TELEPHONE_NUMBER_2" VARCHAR2(12), 
	"WORK_HISTORY_FAX_2" VARCHAR2(12), 
	"WORK_HISTORY_MAILING_ADDRESS_2" VARCHAR2(255), 
	"WORK_HISTORY_CITY_2" VARCHAR2(55), 
	"WORK_HISTORY_STATE_2" VARCHAR2(55), 
	"WORK_HISTORY_ZIP_2" NUMBER(5,0), 
	"WORK_HISTORY_FROM_2" VARCHAR2(5), 
	"WORK_HISTORY_TO_2" VARCHAR2(5), 
	"WORK_HISTORY_CURRENT_PRACTICE_3" VARCHAR2(255), 
	"WORK_HISTORY_CONTACT_3" VARCHAR2(255), 
	"WORK_HISTORY_TELEPHONE_NUMBER_3" VARCHAR2(12), 
	"WORK_HISTORY_FAX_3" VARCHAR2(12), 
	"WORK_HISTORY_MAILING_ADDRESS_3" VARCHAR2(255), 
	"WORK_HISTORY_CITY_3" VARCHAR2(55), 
	"WORK_HISTORY_STATE_3" VARCHAR2(55), 
	"WORK_HISTORY_ZIP_3" NUMBER(5,0), 
	"WORK_HISTORY_FROM_3" VARCHAR2(5), 
	"WORK_HISTORY_TO_3" VARCHAR2(5), 
	"WORK_HISTORY_CURRENT_PRACTICE_4" VARCHAR2(255), 
	"WORK_HISTORY_CONTACT_4" VARCHAR2(255), 
	"WORK_HISTORY_TELEPHONE_NUMBER_4" VARCHAR2(12), 
	"WORK_HISTORY_FAX_4" VARCHAR2(12), 
	"WORK_HISTORY_MAILING_ADDRESS_4" VARCHAR2(255), 
	"WORK_HISTORY_CITY_4" VARCHAR2(55), 
	"WORK_HISTORY_STATE_4" VARCHAR2(55), 
	"WORK_HISTORY_ZIP_4" NUMBER(5,0), 
	"WORK_HISTORY_FROM_4" VARCHAR2(5), 
	"WORK_HISTORY_TO_4" VARCHAR2(5), 
	"QUESTIONS_SUBJECT_TO_FOLLOWING_INQUIRIES" VARCHAR2(1), 
	"QUESTIONS_SUBJECT_TO_FOLLOWING_INQUIRIES_NOTES" CLOB, 
	"QUESTIONS_MEDICAL_SUSPENSION_REVOKED" VARCHAR2(1), 
	"QUESTIONS_MEDICAL_SUSPENSION_REVOKED_NOTES" CLOB, 
	"QUESTIONS_DEA_CERTIFICATE_REVOKED_OR_LIMITED" VARCHAR2(1), 
	"QUESTIONS_DEA_CERTIFICATE_REVOKED_OR_LIMITED_NOTES" CLOB, 
	"QUESTIONS_CONVICTED_CRIMINAL_OFFENSE" VARCHAR2(1), 
	"QUESTIONS_CONVICTED_CRIMINAL_OFFENSE_NOTES" CLOB, 
	"QUESTIONS_INCURRED_MALPRACTICE_CLAIM" VARCHAR2(1), 
	"QUESTIONS_INCURRED_MALPRACTICE_CLAIM_NOTES" CLOB, 
	"QUESTIONS_MALPRACTIC_ARBITRATION_INVOLVING_MED_PRACTICE" VARCHAR2(1), 
	"QUESTIONS_MALPRACTIC_ARBITRATION_INVOLVING_MED_PRACTICE_NOTES" CLOB, 
	"QUESTIONS_SUSPENDED_MEDICARE_OR_MEDICAID" VARCHAR2(1), 
	"QUESTIONS_SUSPENDED_MEDICARE_OR_MEDICAID_NOTES" CLOB, 
	"QUESTIONS_HOSPITAL_PRIVILEGES_SUSPENDED_REVOKED" VARCHAR2(1), 
	"QUESTIONS_HOSPITAL_PRIVILEGES_SUSPENDED_REVOKED_NOTES" CLOB, 
	"QUESTIONS_VOLUNTARY_RESIGNED_FROM_MED_STAFF" VARCHAR2(1), 
	"QUESTIONS_VOLUNTARY_RESIGNED_FROM_MED_STAFF_NOTES" CLOB, 
	"QUESTIONS_CURRENTLY_ADDICTED_BEING_TREATED_FOR_DRUGS" VARCHAR2(1), 
	"QUESTIONS_CURRENTLY_ADDICTED_BEING_TREATED_FOR_DRUGS_NOTES" CLOB, 
	"QUESTIONS_SERIOUS_COMMUNICABLE_DISEASE" VARCHAR2(1), 
	"QUESTIONS_SERIOUS_COMMUNICABLE_DISEASE_NOTES" CLOB, 
	"QUESTIONS_PHYSICAL_OR_MENTAL_HEALTH_CONDITION" VARCHAR2(1), 
	"QUESTIONS_PHYSICAL_OR_MENTAL_HEALTH_CONDITION_NOTES" CLOB, 
	"SIGNATURE_DISCLAIMER" CLOB, 
	"SIGNATURE_DATE" DATE, 
	"SIGNATURE_PRINT_NAME" VARCHAR2(255), 
	"E_SIGNATURE" BLOB, 
	"DATE_OF_ENTRY" DATE, 
	"SUPPORTTING_DOCUMENTS" BLOB, 
	"MIME_TYPE" VARCHAR2(55), 
	"SD_DATE" DATE, 
	"SUB_SUB_SPECIALITEIS" VARCHAR2(255), 
	"RESIDENCE_FELLOWSHIP_MAILING_ADDRESS" CLOB, 
	 PRIMARY KEY ("CRIF_ID")
  USING INDEX  ENABLE
   ) ;
/
   CREATE SEQUENCE  "TMS_CREDENTIAL_PROVIDER_INFO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
/

  CREATE OR REPLACE EDITIONABLE TRIGGER "TMS_CREDENTIAL_PROVIDER_INFO_TRIGGER" 
BEFORE INSERT ON "TMS_CREDENTIAL_PROVIDER_INFO"
FOR EACH ROW
BEGIN
	IF :new.CRIF_ID IS NULL THEN
		SELECT TMS_CREDENTIAL_PROVIDER_INFO_seq.nextval INTO :new.CRIF_ID FROM DUAL;
	END IF;
END;
/


BEGIN
    APEX_COLLECTION.TRUNCATE_COLLECTION(
        p_collection_name => 'APEX_SIGNATURE');
END;


BEGIN          
    APEX_COLLECTION.DELETE_COLLECTION(p_collection_name =>'APEX_SIGNATURE');

    EXCEPTION WHEN OTHERS THEN NULL;

END;
