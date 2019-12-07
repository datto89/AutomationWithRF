*** Settings ***
Documentation       Data of parties test suite
Library             DateTime
Library             String
Library             BuiltIn
Library             SeleniumLibrary
Resource            ../../keywords/kolekto.robot
Resource            ./parties.pageObj.robot
Resource            ../contact.test/addContact.pageObj.robot

*** Keywords ***

Setup Parties Test Suite
    Login and change language
    Setup Parties Test Suite Variables
    Create new dossier without adding client in dossier
    #TEST PURPOSE => clear later
    # Wait Until Element Is Visible  xpath://div[@class = 'ms-Nav-linkText linkText-70'][text() = 'Dossiers']  timeout=60
    # Click Element  xpath://div[@class = 'ms-Nav-linkText linkText-70'][text() = 'Dossiers']
    # Wait Until Element Is Visible  xpath://div[@class = 'ms-ListItem-actions w75']/span[text() = '19070804']  timeout=60
    # Click Element  xpath://div[@class = 'ms-ListItem-actions w75']/span[text() = '19070804']
    # Wait Until Element Is Visible  xpath://div[@class = 'ms-Grid-col ms-sm8 dossier-title'][contains(text(), '19070804')]  timeout=60

Setup Parties Test Suite Variables
    ${randomStr}  Generate Random String   8   [NUMBERS]
    Set Suite Variable  @{randomStrList}  ${randomStr}

Open Add party form
    Wait Until Element Is Visible  ${DossierOverview}  timeout=3
    Click Element  ${Add_Party_Button}
    Wait Until Element Is Visible  ${AddParty_Form}  timeout=3

Submit
    Click Button  ${Party_Submit}