*** Settings ***
Documentation   All keywords related to Kolekto Huur App
Library         SeleniumLibrary
Library         BuiltIn
Library         String
Resource        ../Variables/variables.robot
Resource        ../suites/dossier.test/createDossier.resource.robot

*** Keywords ***
Login Kolekto App
    [Arguments]     ${username}     ${pass}
    Open Kolekto App With Maximize
    Set Selenium Implicit Wait  10
    Input Text          name=loginfmt  ${username}
    Click Button        id=idSIButton9
    Wait For Input Password
    Input Password      name=passwd  ${pass}
    Click Button        id=idSIButton9
    Ignore Stay Signed in

Wait For Input Password
    Wait Until Element Is Visible  name=passwd  timeout=5
    Wait Until Element Is Not Visible  css:.lightbox-cover  timeout=5  error=None

Ignore Stay Signed in
    Wait Until Element Is Visible  id=idBtn_Back  timeout=10
    Click Button        id=idBtn_Back

Kolekto Dashboard Should Be Opened
    Location Should Be  ${RootURL}

Open Kolekto App With Maximize
    Open Browser        ${RootURL}  browser=${BROWSER}
    Maximize Browser Window

Go To Dashboard
    Click Link  /

Go To Dossiers
    Click Link  /dossiers

Go To Payment Approval
    Click Link  /payment/approval

Go To Bank Transaction
    Click Link  /payment/bank

Go To Invoices
    Click Link  /invoices

Go To Contacts
    Click Link  /contacts

Go To System Templates
    Click Element  xpath://div[@name='Settings']//i[@data-icon-name='ChevronDown']
    Click Link  /systemsettings/templates

Go To System Process
    Click Element  xpath://div[@name='Settings']//i[@data-icon-name='ChevronDown']
    Click Link  /systemsettings/process

Go To System Bookings
    Click Link  /systemsettings/finance

Go To System Custom Properties
    Click Link  /systemsettings/custom-property

Change Language
    Go to My Settings 
    Click Element  xpath://div[contains(@class,'ms-Panel is-open ms-Panel--hasCloseButton user-settings-panel')]//div[@role="radiogroup"]/div/div[1]//label
    Click Button  css:.user-settings-from .form-buttons button.ms-Button--primary
    Wait Until Page Contains  New dossier  timeout=10

Go to My Settings   
    Wait until Page Contains  Auto Admin SP  timeout=5
    Click Element  css:.appBar 

Login and change language
    Login Kolekto App  username=${ValidUser}  pass=${KolektoPassword}
    Change Language

Kolekto Filter Dropdown Select From List By Value
    [Arguments]     ${locator}     ${value}
    Click Element  ${locator}
    Wait Until Element Is Visible  css:.kolekto-filter-dropdown .options  timeout=10   
    Kolekto Clear Element Text   //input[@placeholder='Company'] 
    Input Text  //input[@placeholder='Company']  ${value}
    Wait Until Element Is Visible  xpath://div[@class='kolekto-filter-dropdown']//div[contains(text(),'${value}')]  timeout=5
    Click Element  //div[@class='kolekto-filter-dropdown']//div[contains(text(),'${value}')]
    #Select From List By Value  //div[@class='kolekto-filter-dropdown']//div[@class='options']  ${value}

Kolekto Filter Dropdown With Scroll Select From List By Value
    [Arguments]     ${locator}     ${value}
    Click Element  ${locator}
    Wait Until Element Is Visible  css:.kolekto-filter-dropdown .options  timeout=5
    Scroll Element Into View  xpath://div[@class='kolekto-filter-dropdown']/div[@class='options']/div[contains(@class,'text-ellipsis option-item')][contains(text(), '${value}')]
    Wait Until Element Is Visible  xpath://div[@class='kolekto-filter-dropdown']/div[@class='options']/div[contains(@class,'text-ellipsis option-item')][contains(text(), '${value}')]  timeout=10
    Click Element  //div[@class='kolekto-filter-dropdown']/div[@class='options']/div[contains(@class,'text-ellipsis option-item')][contains(text(), '${value}')]

Kolekto Dropdown Select From List By Value
    [Arguments]     ${locator}     ${value}
    Click Element  ${locator}
    Wait Until Element Is Visible  css:.ms-Callout.ms-Dropdown-callout  timeout=5
    Wait Until Element Is Visible  xpath://button[contains(@role,'option')]//span[contains(@class,'ms-Dropdown-optionText')][contains(text(), '${value}')]  timeout=5
    Click Element  //button[contains(@role,'option')]//span[contains(@class,'ms-Dropdown-optionText')][contains(text(), '${value}')]


Kolekto Combobox Select From List By Value
    [Arguments]     ${locator}     ${value}
    Click Element  ${locator}
    Wait Until Element Is Visible  css:.ms-Callout.ms-ComboBox-callout  timeout=5
    Wait Until Element Is Visible  xpath://button[contains(@role,'option')]//span[contains(@class,'ms-ComboBox-optionText')][contains(text(), '${value}')]  timeout=5
    Click Element  //button[contains(@role,'option')]//span[contains(@class,'ms-ComboBox-optionText')][contains(text(), '${value}')]

Click Element From Contacts List
    [Arguments]     ${locator}     ${value}
    #Click Element  ${locator}
    Click Element  //div[contains(@class,'ms-ListItem-primaryText')]/div[contains(text(), ('${value}'))]

Kolekto Clear Element Text 
    [Arguments]     ${locator}
    ${value}=     Get Element Attribute   ${locator}      value
    ${backspaces count}=    Get Length    ${value}
    Run Keyword If    """${value}""" != ''    # if there's no current value - no need to slow down by an extra SE call
    ...     Repeat Keyword  ${backspaces count +1}  Press Key  ${locator}   \\08    # backspace \\08

Kolekto Date Picker
    [Documentation]     Select given day from datepicker : dateValue = <dd>-<MM>-yyyy, ex: 24-12-2019
    [Arguments]     ${dateElem}     ${dateValue}
    ${inputElement}    Catenate  ${dateElem}  ${SPACE}  input
    Input Text  ${inputElement}    ${dateValue}

Kolekto Tag Picker
    [Arguments]     ${locator}     ${value}
    Click Element  ${locator}
    Wait Until Element Is Visible  css:.ms-Suggestions  timeout=2
    # Wait Until Element Is Visible  //div[contains(@class, "ms-Suggestions")]//div[contains(@class, "ms-Suggestions-item")]//div[contains(@class, "ms-Persona-primaryText")]/div[text()='${value}']  timeout=3
    Click Element  //div[contains(@class, "ms-Suggestions")]//div[@aria-label="${value}"]

Click Element From Activities List
    [Arguments]     ${locator}     ${value}
    Click Element  ${locator}
    Click Element  //div[@class='eventsContainer']//div[contains(@class, 'eventsPlaceholder')]//div[contains(@class, 'kolekto-detail-row')]//span[@class='description'][contains(text(), ('${value}'))]

Click Element From Parties List
    [Arguments]     ${locator}     ${value}
    Click Element  ${locator}
    Click Element  //div[contains(@class,'party-overview')]//div[contains(@class,'pointer')]//div[text()='${value}']

Kolekto Time Picker
    [Arguments]     ${locator}     ${value}
    Click Element  ${locator}
    Wait Until Element Is Visible  css:.time-options  timeout=3
    Scroll Element Into View    //div[@class='kolekto-time-picker']/div[@class='time-options']/div[@class='container']/div[@class='item'][text()= '${value}']            
    Click Element   //div[@class='kolekto-time-picker']/div[@class='time-options']/div[@class='container']/div[@class='item'][text()= '${value}']

Kolekto People Picker
    [Arguments]     ${locator}     ${value}
    Click Element  ${locator}
    Wait Until Element Is Visible  css:.ms-Suggestions  timeout=2
    Wait Until Element Is Visible  //div[contains(@class, "ms-Suggestions")]//div[contains(@class, "ms-Suggestions-item")]//div[contains(@class, "ms-Persona-primaryText")]/div[text()='${value}']  timeout=3
    Click Element  //div[contains(@class, "ms-Suggestions")]//div[contains(@class, "ms-Suggestions-item")]//div[contains(@class, "ms-Persona-primaryText")]/div[text()='${value}']


Create new dossier with default values
    Given Dossier list Opened
    When Open new dossier form
    Then New dossier form is opened
    Complete General information part
    Complete Property part
    Wait Duplicated Address block show
    Save new dossier form
    It opens dossier overview


Create new dossier without adding client in dossier
    Given Dossier list Opened
    When Open new dossier form
    Then New dossier form is opened
    Complete General information part with unchecking 'Add as client in dossier'
    Complete Property part
    Wait Duplicated Address block show
    Save new dossier form
    It opens dossier overview

Create new dossier from Dashboard
    Go to Dashboard
    Click Button  ${NewDossierButton}
    Then New dossier form is opened
    Complete General information part
    Complete Property part
    Wait Duplicated Address block show
    Save new dossier form
    It opens dossier overview



