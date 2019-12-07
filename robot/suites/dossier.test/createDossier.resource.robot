*** Settings ***
Documentation       Data of create dossier test suite
Library             DateTime
Library             String
Library             BuiltIn
Library             SeleniumLibrary
Resource            ../../keywords/kolekto.robot
Resource            ./createDossier.pageObj.robot

*** Keywords ***
Setup New Dossier Test Suite
    Login and change language
    Setup New Dossier Test Suite Variables

Setup New Dossier Test Suite Variables
    ${randomStr}  Generate Random String   8   [NUMBERS]
    Set Suite Variable  @{randomStrList}  ${randomStr}
    
Dossier list Opened
    Go To Dossiers
    Wait Until Element Is Visible  css:.dossierListContainer  timeout=20

Open new dossier form
    Click Button  ${NewDossierButton}

New dossier form is opened
    Wait Until Element Is Visible  ${NewDossierForm}   timeout=5

Dossier reference is filled automatically
    Wait Until Element Is Visible  ${Newdossier_DossierReference}  timeout=3
    ${year}  DateTime.Get Current Date  time_zone=local  increment=0  result_format=%y%m
    #Page Should Contain  ${year}
    Wait Until Page Contains  ${year}  timeout=5

Complete General information part
    Input Text  ${ExternalReference}  ExtRef@{randomStrList}[0] 
    Kolekto Dropdown Select From List By Value  ${DossierOwner}  Auto DO
    Wait Until Element Contains  ${DossierOwner}  Auto DO  timeout=3
    Click Element  ${Newdossier_BeneficiaryCheckbox}
    Kolekto Dropdown Select From List By Value  ${DossierType}  Flow for auto test1
    Kolekto Dropdown Select From List By Value  ${ProcessStage}  Stage: Debt management

Complete Ownership part
    Kolekto Combobox Select From List By Value  ${Newdossier_Handler}  Auto Admin SP
    Kolekto Dropdown Select From List By Value  ${Newdossier_HandlingOrg}  Auto DO


Complete Property part
    Input Text  ${PropertyName}  Auto test@{randomStrList}[0]
    Input Text  ${Newdossier_PostalCode_Input}  2909lg
    Input Text  ${Newdosssier_Number_Input}  11
    Input Text  ${Newdossier_AdditionNumber}  AB
    Wait Until Element Is Visible  ${Newdossier_AddressField}  timeout=5
    Wait Until Element Is Visible  ${Newdossier_CityField}  timeout=5
    Input Text  ${Newdosssier_PropertyReference}  12345

Complete Claim part
    Kolekto Combobox Select From List By Value  ${Newdossier_BookingCategory}  1.01 Rent
    Input Text  ${Newdossier_Amount_Input}  500
    Input Text  ${Newdossier_Description}   for Automation test

Complete Claim part with optional fields
    Kolekto Combobox Select From List By Value  ${Newdossier_BookingCategory}  1.01 Rent
    Input Text  ${Newdossier_Amount_Input}  1000
    Input Text  ${Newdossier_Description}   for Automation test2
    Kolekto Clear Element Text   ${Newdossier_BookingDate_Input}
    Kolekto Clear Element Text   ${Newdossier_CalculatedUntil}
    Input Text  ${Newdossier_BookingDate_Input}  01-05-2019
    Input Text  ${Newdossier_CalculatedUntil}  31-05-2019
    Wait Until Element Is Visible  ${Newdossier_CalculatedUntil}  timeout=3

Complete Retal agreement part
    Input Text  ${Newdossier_RentalAmount_Input}  500
    Input Text  ${Newdossier_RentalReference}  Rental agreement for Auto test
    Kolekto Dropdown Select From List By Value  ${Newdossier_Frequency}  Per quarter
    Kolekto Date Picker  ${Newdossier_DatePicker_RentalStartDate}  01-06-2019
    Kolekto Date Picker  ${Newdossier_DatePicker_RentalEndDate}  01-06-2021

Save new dossier form
    Click Button  ${Newdossier_SaveButton}

Save new dossier form again 
    Click Button  ${Newdossier_SaveButton}

It opens dossier overview
    Wait Until Element Contains  ${DossierOverview}  Auto test@{randomStrList}[0]  timeout=10

Wrong address
    Input Text  ${Newdossier_PostalCode_Input}  2901lg
    Input Text  ${Newdosssier_Number_Input}  22
    Input Text  ${Newdossier_AdditionNumber}  AB
    Wait Until Element Contains  ${Newdossier_PostalCode}  Invalid postalcode  timeout=3
    Wait Until Element Contains  ${Newdosssier_Number}  Invalid address number  timeout=3
    Kolekto Clear Element Text   ${Newdossier_PostalCode_Input}
    Kolekto Clear Element Text   ${Newdosssier_Number_Input}
    Input Text  ${Newdossier_PostalCode_Input}  2909lg
    Input Text  ${Newdosssier_Number_Input}  11
    Input Text  ${Newdossier_AdditionNumber}  AB
    Wait Until Element Is Visible  ${Newdossier_AddressField}  timeout=5
    Wait Until Element Is Visible  ${Newdossier_CityField}  timeout=5


Input letters to Claim amount field 
    Kolekto Combobox Select From List By Value  ${Newdossier_BookingCategory}  1.01 Rent
    Input Text  ${Newdossier_Amount_Input}  abcd
    Click Element  ${Newdossier_Description}
    Wait Until Element Contains  ${Newdossier_Amount}  Please provide a number.  timeout=3
    Kolekto Clear Element Text   ${Newdossier_Amount_Input}
    Input Text  ${Newdossier_Amount_Input}  500
    Click Element  ${Newdossier_Description}  
    Wait Until Element Does Not Contain  ${Newdossier_Amount}  Please provide a number.  timeout=3

Input letters to Rental agreement amount field 
    Input Text  ${Newdossier_RentalAmount_Input}  abcd
    Click Element  ${Newdossier_RentalReference}
    Wait Until Element Contains  ${Newdossier_RentalAmount}  Please provide a number.  timeout=3
    Kolekto Clear Element Text   ${Newdossier_RentalAmount_Input}
    Input Text  ${Newdossier_RentalAmount_Input}  500
    Click Element  ${Newdossier_RentalReference}
    Wait Until Element Does Not Contain  ${Newdossier_RentalAmount}   Please provide a number.  timeout=3

Wrong format for Date in Claim part 
    Input Text  ${Newdossier_BookingDate_Input}  31-06-2019
    Click Element  ${Newdossier_Description}
    Wait Until Element Contains  ${Newdossier_BookingDate}  Please provide a valid date.  timeout=3
    Kolekto Clear Element Text   ${Newdossier_BookingDate_Input}
    Input Text  ${Newdossier_BookingDate_Input}  30-06-2019
    Click Element  ${Newdossier_Description}
    Wait Until Element Does Not Contain  ${Newdossier_BookingDate}  Please provide a valid date.  timeout=3

Wrong format for Date in Rental agreement part
    Kolekto Date Picker  ${Newdossier_DatePicker_RentalStartDate}  31-06-2019
    Click Element  ${Newdossier_RentalReference}
    Wait Until Element Contains  ${Newdossier_DatePicker_RentalStartDate}  Please provide a valid date.  timeout=2
    Kolekto Clear Element Text   ${Newdossier_DatePicker_RentalStartDate_Input}
    Kolekto Date Picker  ${Newdossier_DatePicker_RentalStartDate}  01-06-2019
    Click Element  ${Newdossier_RentalReference}
    Wait Until Element Does Not Contain  ${Newdossier_DatePicker_RentalStartDate}  Please provide a valid date.  timeout=2

    Kolekto Date Picker  ${Newdossier_DatePicker_RentalEndDate}  31-06-2021
    Click Element  ${Newdossier_RentalReference}
    Wait Until Element Contains  ${Newdossier_DatePicker_RentalEndDate}  Please provide a valid date.  timeout=2
    Kolekto Clear Element Text   ${Newdossier_DatePicker_RentalEndDate_Input}
    Kolekto Date Picker  ${Newdossier_DatePicker_RentalEndDate}  30-06-2021
    Click Element  ${Newdossier_RentalReference}
    Wait Until Element Does Not Contain  ${Newdossier_DatePicker_RentalEndDate}  Please provide a valid date.  timeout=2

Wait Duplicated Address block show 
    Wait Until Element Contains  ${NewDossier_DuplicatedAddress}  Dossier(s) found at the same address  timeout=10

Complete General information part with unchecking 'Add as client in dossier'
    Input Text  ${ExternalReference}  ExtRef@{randomStrList}[0] 
    Kolekto Dropdown Select From List By Value  ${DossierOwner}  Auto DO
    Wait Until Element Contains  ${DossierOwner}  Auto DO  timeout=3
    Click Button  ${Newdossier_AddClient_Checkbox}
    Kolekto Dropdown Select From List By Value  ${DossierType}  Flow for auto test1
    Kolekto Dropdown Select From List By Value  ${ProcessStage}  Stage: Debt management