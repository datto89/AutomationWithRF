*** Settings ***
Documentation       Data of templates test suite
Library             DateTime
Library             String
Library             BuiltIn
Library             SeleniumLibrary
Resource            ../../../keywords/kolekto.robot
Resource            ./templates.pageObj.robot


*** Keywords ***

Setup Templates Test Suite
    Login and change language
    Setup Templates Test Suite Variables

Setup Templates Test Suite Variables
    ${randomStr}  Generate Random String   8   [NUMBERS]
    Set Suite Variable  @{randomStrList}  ${randomStr}

#TEMPLATES CATEGORIES

Click Element From Categories List
    [Arguments]     ${locator}     ${value}
    Click Element  ${locator}
    Click Element  //div[contains(@class,'kolekto-categories')]//div[contains(@class,'ms-DetailsRow-cell')][contains(text(),'${value}')]

Add template category
    Click Element  ${Add_Category_Button}
    Wait Until Element Is Visible  ${Add_Category_Form}  timeout=3
    Input Text  ${Category_Name}  Auto 3
    Click Button  ${Category_Submit_Button}

Check template category aftef adding
    Wait Until Element Contains  ${Category_List}  Auto 3  timeout=3

Open again add category form
    Click Element From Categories List  ${Category_List}  Auto 3
    Wait Until Element Is Visible  ${Edit_Category_Form}  timeout=3

Edit category
    Kolekto Clear Element Text   ${Category_Name}
    Input Text  ${Category_Name}  Auto 3_edited
    Click Button  ${Category_Submit_Button}

Check template category after editting
    Wait Until Element Contains  ${Category_List}  Auto 3_edited  timeout=3

From template category list, delete category that used by some templates
    Mouse Over  //div[contains(@class,'kolekto-categories')]//div[contains(@class,'ms-DetailsRow-cell')][contains(text(),'Auto 2')]
    Click Element  //div[contains(@class,'kolekto-categories')]//div[contains(@class,'ms-DetailsRow-cell')][contains(text(),'Auto 2')]/span[@class='delete-icon']

Check the warning message
    Wait Until Element Is Visible  ${Category_Delete_Warning}  timeout=5

Cancel
    Click Button  ${Category_Warning_Cancel}
    Wait Until Element Is Visible  //div[contains(@class,'kolekto-categories')]//div[contains(@class,'ms-DetailsRow-cell')][contains(text(),'Auto 2')]  timeout=3

From template category list, delete category that isn't used by some templates
    Mouse Over  //div[contains(@class,'kolekto-categories')]//div[contains(@class,'ms-DetailsRow-cell')][contains(text(),'Auto 3_edited')]
    Click Element  //div[contains(@class,'kolekto-categories')]//div[contains(@class,'ms-DetailsRow-cell')][contains(text(),'Auto 3_edited')]/span[@class='delete-icon']

Confirm the warning message
    Wait Until Element Is Visible  ${Category_Delete_Warning}  timeout=5
    Click Element  ${Category_Warning_Confirm}

Check template category after deleting
    Reload Page
    Wait Until Element Does Not Contain  ${Category_List}  Auto 3_edited  timeout=10

# SMS TEMPLATES
Click Element From SMS Templates List
    [Arguments]     ${locator}     ${value}
    Click Element  ${locator}
    Click Element  //div[contains(@class,'kolekto-text-message-templs')]//div[contains(@class,'ms-DetailsRow-cell')][contains(text(),'${value}')]

Add SMS template
    Click Element  ${Add_SMS_Button}
    Wait Until Element Is Visible  ${Add_SMS_Form}  timeout=10
    Sleep  3s
    Choose File  ${SMS_ChooseFile}  C:/Kolekto.Huur.AutoTest/Test data/Templates/SMS Auto Test1.docx
    Input Text  ${Template_Name}  SMS Auto Test1
    Kolekto Dropdown Select From List By Value  ${Template_Category}  Auto 1
    Kolekto Tag Picker  ${Template_Recipient_Group}  Client
    Kolekto Tag Picker  ${Template_Process}  Collection
    Kolekto Tag Picker  ${Template_Dossier_Type}  Flow for auto test1
    Kolekto Tag Picker  ${Template_Action_Type}  Type 1_DM
    Click Button  ${SMS_Template_Submit_Button}

Check SMS template after adding
    Wait Until Element Contains  ${SMS_Template_List}  SMS Auto Test1  timeout=5

Open edit SMS template form
    Click Element From SMS Templates List  ${SMS_Template_List}  SMS Auto Test1
    Wait Until Element Is Visible  ${Add_SMS_Form}  timeout=5
    Sleep  3s

Change SMS template information
    Choose File  ${SMS_ChooseFile}  C:/Kolekto.Huur.AutoTest/Test data/Templates/SMS Auto Test2.docx
    Kolekto Clear Element Text   ${Template_Name}
    Input Text  ${Template_Name}  SMS Auto Test2
    Kolekto Dropdown Select From List By Value  ${Template_Category}  Auto 2
    Kolekto Tag Picker  ${Template_Recipient_Group}  Claimant
    Click Element  //div[@class='sms-template-form formContainer']//div[@class='kolekto-tagpicker kolekto-stage']//span[contains(@class,'ms-TagItem-close')]  #?
    Kolekto Tag Picker  ${Template_Process}  Collection
    Click Element  //div[@class='sms-template-form formContainer']//div[@class='kolekto-tagpicker kolekto-action-type-selector']//span[contains(@class,'ms-TagItem-close')]  #?
    Kolekto Tag Picker  ${Template_Action_Type}  Type 2_Collection
    Wait Until Element Is Visible  ${Template_FileView_Block}  timeout=5  #?
    Click Element  ${Template_DoubleChevronDown_Icon}     #?  
    Wait Until Element Is Visible  ${Template_PreviewFile}  timeout=3   #?
    Click Button  ${SMS_Template_Submit_Button}

Check SMS template after editing
    Wait Until Element Contains  ${SMS_Template_List}  SMS Auto Test2  timeout=5

From SMS templates list, delete SMS template
    Mouse Over  //div[contains(@class,'kolekto-text-message-templs')]//div[contains(@class,'ms-DetailsRow-cell')][contains(text(),'SMS Auto Test2')]
    Click Element  //div[contains(@class, 'kolekto-text-message-templs')]//div[contains(@class, 'kolekto-detail-row')]//div[text()='SMS Auto Test2']/following-sibling::div[2]//i[@class='ms-Icon ms-Icon--Delete']
    Wait Until Element Is Visible  ${Template_Confirm_Box}  timeout=3
    Click Button  ${Template_Confirm_Box_YesButton}

Check SMS template after deleting
    Wait Until Element Does Not Contain  ${SMS_Template_List}  SMS Auto Test2  timeout=20

#LETTER TEMPLATES
Click Element From Letter Templates List
    [Arguments]     ${locator}     ${value}
    Click Element  ${locator}
    Click Element  //div[contains(@class,'kolekto-letter-templs')]//div[contains(@class,'ms-DetailsRow-cell')][contains(text(),'${value}')]

Add letter template
    Click Element  ${Add_Letter_Button}
    Wait Until Element Is Visible  ${Add_Letter_Form}  timeout=10
    Sleep  3s
    Choose File  ${Letter_ChooseFile}  D:/SWG/Source code/KolektoHuur/Kolekto.Huur.AutoTest/Test data/Templates/Letter Auto Test1.docx
    Input Text  ${Template_Name}  Letter Auto Test1
    Kolekto Dropdown Select From List By Value  ${Template_Category}  Auto 1
    Kolekto Tag Picker  ${Template_Recipient_Group}  Administrator
    Kolekto Tag Picker  ${Template_Process}  Collection
    Kolekto Tag Picker  ${Template_Dossier_Type}  Flow for auto test1
    Kolekto Tag Picker  ${Template_Action_Type}  Type 2_Collection
    Click Button  ${Letter_Template_Submit_Button}

Check letter template after adding
    Wait Until Element Contains  ${Letter_Template_List}  Letter Auto Test1  timeout=5

Open edit letter template form
    Click Element From Letter Templates List  ${Letter_Template_List}  Letter Auto Test1
    Wait Until Element Is Visible  ${Add_Letter_Form}  timeout=5
    Sleep  3s

Change letter template information
    Choose File  ${Letter_ChooseFile}  D:/SWG/Source code/KolektoHuur/Kolekto.Huur.AutoTest/Test data/Templates/Letter Auto Test2.docx
    Kolekto Clear Element Text   ${Template_Name}
    Input Text  ${Template_Name}  Letter Auto Test2
    Kolekto Dropdown Select From List By Value  ${Template_Category}  Auto 2
    Kolekto Tag Picker  ${Template_Recipient_Group}  Debtor
    Click Element  //div[@class='letter-template-form formContainer']//div[@class='kolekto-tagpicker kolekto-stage']//span[contains(@class,'ms-TagItem-close')]
    Kolekto Tag Picker  ${Template_Process}  Litigation
    Click Element  //div[@class='letter-template-form formContainer']//div[@class='kolekto-tagpicker kolekto-action-type-selector']//span[contains(@class,'ms-TagItem-close')]
    Kolekto Tag Picker  ${Template_Action_Type}  Type 3_Litigation
    Wait Until Element Is Visible  ${Template_FileView_Block}  timeout=5
    Click Element  ${Template_DoubleChevronDown_Icon}
    Wait Until Element Is Visible  ${Template_PreviewFile}  timeout=3
    Click Button  ${Letter_Template_Submit_Button}

Check letter template after editing
    Wait Until Element Contains  ${Letter_Template_List}  Letter Auto Test2  timeout=5

From letter templates list, delete SMS template
    Mouse Over  //div[contains(@class,'kolekto-letter-templs')]//div[contains(@class,'ms-DetailsRow-cell')][contains(text(),'Letter Auto Test2')]
    Click Element  //div[contains(@class, 'kolekto-letter-templs')]//div[contains(@class, 'kolekto-detail-row')]//div[text()='Letter Auto Test2']/following-sibling::div[2]//i[@class='ms-Icon ms-Icon--Delete']
    Wait Until Element Is Visible  ${Template_Confirm_Box}  timeout=3
    Click Button  ${Template_Confirm_Box_YesButton}

Check letter template after deleting
    Wait Until Element Does Not Contain  ${Letter_Template_List}  Letter Auto Test2  timeout=20

#EMAIL TEMPLATES
Click Element From Email Templates List
    [Arguments]     ${locator}     ${value}
    Click Element  ${locator}
    Click Element  //div[contains(@class,'kolekto-email-templs')]//div[contains(@class,'ms-DetailsRow-cell')][contains(text(),'${value}')]

Add email template
    Click Element  ${Add_Email_Button}
    Wait Until Element Is Visible  ${Add_Email_Form}  timeout=10
    Sleep  3s
    Choose File  ${Email_ChooseFile}  D:/SWG/Source code/KolektoHuur/Kolekto.Huur.AutoTest/Test data/Templates/Email Auto Test1.docx
    Input Text  ${Template_Name}  Email Auto Test1
    Input Text  ${Template_Subject}  Test send email by automation
    Kolekto Dropdown Select From List By Value  ${Template_Category}  Auto 1
    Kolekto Tag Picker  ${Template_Recipient_Group}  Debtor
    Kolekto Tag Picker  ${Template_Process}  Execution
    Kolekto Tag Picker  ${Template_Dossier_Type}  Flow for auto test1
    Kolekto Tag Picker  ${Template_Action_Type}  Type 4_Execution
    Click Button  ${Email_Template_Submit_Button}

Check email template after adding
    Wait Until Element Contains  ${Email_Template_List}  Email Auto Test1  timeout=5

Open edit email template form
    Click Element From Email Templates List  ${Email_Template_List}  Email Auto Test1
    Wait Until Element Is Visible  ${Add_Email_Form}  timeout=5
    Sleep  3s

Change email template information
    Choose File  ${Email_ChooseFile}  D:/SWG/Source code/KolektoHuur/Kolekto.Huur.AutoTest/Test data/Templates/Email Auto Test2.docx
    Kolekto Clear Element Text   ${Template_Name}
    Input Text  ${Template_Name}  Email Auto Test2
    Kolekto Clear Element Text   ${Template_Subject}
    Input Text  ${Template_Subject}  Test send email by automation_edited
    Kolekto Dropdown Select From List By Value  ${Template_Category}  Auto 2
    Kolekto Tag Picker  ${Template_Recipient_Group}  Third party
    Click Element  //div[@class='email-template-form formContainer']//div[@class='kolekto-tagpicker kolekto-stage']//span[contains(@class,'ms-TagItem-close')]
    Kolekto Tag Picker  ${Template_Process}  Litigation
    Click Element  //div[@class='email-template-form formContainer']//div[@class='kolekto-tagpicker kolekto-action-type-selector']//span[contains(@class,'ms-TagItem-close')]
    Kolekto Tag Picker  ${Template_Action_Type}  Type 3_Litigation
    Wait Until Element Is Visible  ${Template_FileView_Block}  timeout=5
    Click Element  ${Template_DoubleChevronDown_Icon}
    Wait Until Element Is Visible  ${Template_PreviewFile}  timeout=3
    Click Button  ${Email_Template_Submit_Button}

Check email template after editing
    Wait Until Element Contains  ${Email_Template_List}  Email Auto Test2  timeout=5

From email templates list, delete SMS template
    Mouse Over  //div[contains(@class,'kolekto-email-templs')]//div[contains(@class,'ms-DetailsRow-cell')][contains(text(),'Email Auto Test2')]
    Click Element  //div[contains(@class, 'kolekto-email-templs')]//div[contains(@class, 'kolekto-detail-row')]//div[text()='Email Auto Test2']/following-sibling::div[3]//i[@class='ms-Icon ms-Icon--Delete']
    Wait Until Element Is Visible  ${Template_Confirm_Box}  timeout=3
    Click Button  ${Template_Confirm_Box_YesButton}

Check email template after deleting
    Wait Until Element Does Not Contain  ${Email_Template_List}  Email Auto Test2  timeout=20