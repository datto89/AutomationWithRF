*** Settings ***
Documentation       Data of parties test suite
Library             DateTime
Library             String
Library             BuiltIn
Library             SeleniumLibrary
Resource            ../../keywords/kolekto.robot
Resource            ./parties.pageObj.robot

*** Keywords ***

Setup Parties Court Test Suite
    Login and change language
    Setup Parties Court Test Suite Variables
    Create new dossier from Dashboard
    #TEST PURPOSE => clear later
    # Wait Until Element Is Visible  xpath://div[@class = 'ms-Nav-linkText linkText-70'][text() = 'Dossiers']  timeout=60
    # Click Element  xpath://div[@class = 'ms-Nav-linkText linkText-70'][text() = 'Dossiers']
    # Wait Until Element Is Visible  xpath://div[@class = 'ms-ListItem-actions w75']/span[text() = '19070797']  timeout=60
    # Click Element  xpath://div[@class = 'ms-ListItem-actions w75']/span[text() = '19070797']
    # Wait Until Element Is Visible  xpath://div[@class = 'ms-Grid-col ms-sm8 dossier-title'][contains(text(), '19070797')]  timeout=60

Setup Parties Court Test Suite Variables
    ${randomStr}  Generate Random String   8   [NUMBERS]
    Set Suite Variable  @{randomStrList}  ${randomStr}

Change property
    Wait Until Element Is Visible  ${DossierOverview}  timeout=2
    Click Element  ${Property_Block}
    Wait Until Element Is Visible  ${Property_Form}  timeout=3
    Kolekto Clear Element Text   ${Property_PostCode_Input}
    Kolekto Clear Element Text   ${Property_Number_Input}
    Kolekto Clear Element Text   ${Property_Addition_Input}
    Input Text  ${Property_PostCode_Input}  1111ab
    Input Text  ${Property_Number_Input}  11
    Input Text  ${Property_Addition_Input}  ADD
    Wait Until Element Contains  ${Property_Form}  Changing address may change the court location  timeout=5
    Wait Until Element Is Visible  ${Property_Street}  timeout=5
    Wait Until Element Is Visible  ${Property_City}  timeout=5
    Element Attribute Value Should Be  ${Property_Street}  value  Diemerkade
    Element Attribute Value Should Be  ${Property_City}  value  Diemen
    Sleep  3s
    Click Element  ${Property_Submit}

Check court and court location in dossier overview
    Wait Until Element Contains  ${Parties_List}  Amsterdam, Amsterdam  timeout=5
    
Check court and court location in court form
    Click Element From Parties List  ${Parties_List}  Amsterdam
    Wait Until Element Is Visible  ${Court_Form}  timeout=5
    # Element Text Should Be  ${Court_Field_Compare}  Amsterdam
    # Element Text Should Be  ${CourtLocation_Field_Compare}  Amsterdam
    Click Element  ${Court_Details}
    Wait Until Element Contains  ${Court_Info}  Visit address  timeout=3
    Element Should Contain  ${Court_Info}  Amsterdam
    Click Button  ${Court_Cancel}

Change court and court location
    Wait Until Element Is Visible  ${Parties_List}  timeout=3
    Click Element From Parties List  ${Parties_List}  Amsterdam
    Wait Until Element Is Visible  ${Court_Form}  timeout=5
    Kolekto Dropdown Select From List By Value  ${Court_Field}  Den Haag
    Kolekto Dropdown Select From List By Value  ${CourtLocation_Field}  Leiden
    Wait Until Element Is Visible  ${Court_Details}  timeout=10
    Click Button  ${Court_Submit}

Check court details
    Click Element From Parties List  ${Parties_List}  Den Haag
    Wait Until Element Is Visible  ${Court_Form}  timeout=5
    Click Element  ${Court_Details}
    Wait Until Element Contains  ${Court_Info}  Visit address  timeout=3
    Element Should Contain  ${Court_Info}  Leiden
    Click Button  ${Court_Cancel}

Check court and court location in Parties list
    Wait Until Element Is Not Visible  ${Court_Form}  timeout=5
    Wait Until Element Contains  ${Parties_List}   Den Haag, Leiden  timeout=5



