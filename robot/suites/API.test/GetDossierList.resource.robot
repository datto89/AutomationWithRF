*** Settings ***
Documentation       Data of activites test suite
Library             DateTime
Library             String
Library             BuiltIn
Library             SeleniumLibrary
Resource            ../../keywords/kolekto.robot



*** Keywords ***

Setup Activities Test Suite
    Login and change language
    Setup Activities Test Suite Variables
    
    #Create new dossier with default values
    #TEST PURPOSE => clear later
    # Wait Until Element Is Visible  xpath://div[contains(@class,'ms-Nav-linkText')][text() = 'Dossiers']  timeout=60
    # Click Element  xpath://div[contains(@class,'ms-Nav-linkText')][text() = 'Dossiers']
    # Wait Until Element Is Visible  xpath://div[@class = 'ms-ListItem-actions w75']/span[text() = '19070783']  timeout=60
    # Click Element  xpath://div[@class = 'ms-ListItem-actions w75']/span[text() = '19070783']
    # Wait Until Element Is Visible  xpath://div[@class = 'ms-Grid-col ms-sm8 dossier-title'][contains(text(), '19070783')]  timeout=60

Setup Activities Test Suite Variables
    ${randomStr}  Generate Random String   8   [NUMBERS]
    Set Suite Variable  @{randomStrList}  ${randomStr}
    ${cookie}  Get Cookies
    Set Suite Variable  ${Header_Cookie}  ${cookie}