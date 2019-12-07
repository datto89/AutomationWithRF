*** Settings ***
Documentation       Data of templates test suite
Library             DateTime
Library             String
Library             BuiltIn
Library             SeleniumLibrary
Resource            ../../../keywords/kolekto.robot
Resource            ./process-flow.pageObj.robot


*** Keywords ***
Setup Process Test Suite
    Login and change language
    Setup Process Test Suite Variables

Setup Process Test Suite Variables
    ${randomStr}  Generate Random String   8   [NUMBERS]
    Set Suite Variable  @{randomStrList}  ${randomStr}

Add new dossier type
    Sleep  2s
    Click Element  ${Add_DossierType_Icon}
    Wait Until Element Is Visible  ${DossierType_Form}  timeout=3
    Input Text  ${DossierType_Name}  Auto Test Process flow
    Input Text  ${DossierType_Purpose}  Dosser type for automation test
    Click Button  ${DossierType_Save_Button}

Check dossier type in dossier types list
    Wait Until Element Contains  ${DossierType_List}  Auto Test Process flow  timeout=5

Go to Flow management
    Click Element  ${Edit_Process}
    Wait Until Element Is Visible  ${Flow_Management}  timeout=10

Add manual action for Debt management stage
    Click Element  ${Process_DM_Add_Icon}
    Wait Until Element Is Visible  ${Process_Add_Action_Form}  timeout=3
    Kolekto Filter Dropdown Select From List By Value  ${Process_Action_Type}  Type 1_DM
    Input Text  ${Process_Action_Name}  AutoTest_DM_Manual action
    Input Text  ${Process_Action_Description}  Automation test for Process stage DM manual action
    Kolekto Dropdown Select From List By Value  ${Process_Action}  Create email
    Kolekto Filter Dropdown Select From List By Value  ${Process_Template_Email}  Email template for process flow DM1
    Kolekto Filter Dropdown Select From List By Value  ${Process_Template_Letter}  Letter template for process flow DM1
    Input Text  ${Process_Schedule_Delay}  3
    Kolekto Dropdown Select From List By Value  ${Process_Action_Completed}  DM1
    Click Button  ${Process_Action_Save_Button}
    Wait Until Element Contains  ${Flow_Management}  AutoTest_DM_Manual action  timeout=5

Add auto action for Debt management stage
    Click Element  ${Process_DM_Add_Icon}
    Wait Until Element Is Visible  ${Process_Add_Action_Form}  timeout=3
    Kolekto Filter Dropdown Select From List By Value  ${Process_Action_Type}  Type 2_DM
    Input Text  ${Process_Action_Name}  AutoTest_DM_Auto action
    Input Text  ${Process_Action_Description}  Automation test for Process stage DM auto action
    Click Element  ${Process_ActionType_Toggle}
    Wait Until Element Is Visible  ${Process_ActionType_Toggle_Checked}  timeout=2
    Kolekto Dropdown Select From List By Value  ${Process_Action}  Create email
    Kolekto Filter Dropdown Select From List By Value  ${Process_Template_Email}  Email template for process flow DM1
    Kolekto Filter Dropdown Select From List By Value  ${Process_Template_Letter}  Letter template for process flow DM1
    Click Button  ${Process_Action_Save_Button}
    Wait Until Element Contains  ${Flow_Management}  AutoTest_DM_Auto action  timeout=5

Add manual action for Collection stage
    Click Element  ${Process_Collection_Add_Icon}
    Wait Until Element Is Visible  ${Process_Add_Action_Form}  timeout=3
    Kolekto Filter Dropdown Select From List By Value  ${Process_Action_Type}  Type 3_Collection
    Input Text  ${Process_Action_Name}  AutoTest_Collection_Manual action
    Input Text  ${Process_Action_Description}  Automation test for Process stage Collection manual action
    Kolekto Dropdown Select From List By Value  ${Process_Action}  Create SMS
    Kolekto Filter Dropdown Select From List By Value  ${Process_Template_Email}  Email template for process flow DM1
    Kolekto Filter Dropdown Select From List By Value  ${Process_Template_Letter}  Letter template for process flow DM1
    Input Text  ${Process_Schedule_Delay}  3
    Kolekto Dropdown Select From List By Value  ${Process_Action_Completed}  DM1
    Click Button  ${Process_Action_Save_Button}
    Wait Until Element Contains  ${Flow_Management}  AutoTest_DM_Manual action  timeout=5

Add auto action for Collection stage
Add manual action for Litigation stage
Add auto action for Litigation stage
Add manual action for Execution stage
Add auto action for Execution stage