*** Settings ***
Documentation       Data of activites test suite
Library             DateTime
Library             String
Library             BuiltIn
Library             SeleniumLibrary
Resource            ../../keywords/kolekto.robot
Resource            ./activities.pageObj.robot



*** Keywords ***

Setup Activities Test Suite
    Login and change language
    Setup Activities Test Suite Variables
    Create new dossier with default values
    #TEST PURPOSE => clear later
    # Wait Until Element Is Visible  xpath://div[contains(@class,'ms-Nav-linkText')][text() = 'Dossiers']  timeout=60
    # Click Element  xpath://div[contains(@class,'ms-Nav-linkText')][text() = 'Dossiers']
    # Wait Until Element Is Visible  xpath://div[@class = 'ms-ListItem-actions w75']/span[text() = '19070783']  timeout=60
    # Click Element  xpath://div[@class = 'ms-ListItem-actions w75']/span[text() = '19070783']
    # Wait Until Element Is Visible  xpath://div[@class = 'ms-Grid-col ms-sm8 dossier-title'][contains(text(), '19070783')]  timeout=60

Setup Activities Test Suite Variables
    ${randomStr}  Generate Random String   8   [NUMBERS]
    Set Suite Variable  @{randomStrList}  ${randomStr}

#NOTE
Open Note form
    Click Element  ${Note_Icon}
    Wait Until Element Is Enabled  ${Note_Form}  timeout=2

Specify date
    Kolekto Clear Element Text   ${Note_Date_Input}
    Kolekto Date Picker  ${Note_Date}  01-06-2019

Add Note
    Input Text  ${Note_Description}  Test note for automation test@{randomStrList}[0]

Switch on the toggle 'Internal'
    Click Element  ${Note_InternalToggle}
    Wait Until Element Is Visible  ${Note_InternalToggle_Checked}  timeout=2

Change flow status
    Click Element  ${Note_FlowStatusIcon} 
    Wait Until Element Is Visible  ${Note_Status}  timeout=3
    Kolekto Filter Dropdown Select From List By Value  ${Note_Status}  DM1
    Wait Until Element Is Enabled  ${Note_Status_Description}  timeout=2
    Input Text  ${Note_Status_Description}  Change flow status for note@{randomStrList}[0]

Submit for Note form
    Click Button  ${Note_Submit}

Verify Note item in Activities list and Status Component
    Wait Until Element Contains  ${Activities_List}  Test note for automation test@{randomStrList}[0]  timeout=3
    Wait Until Element Contains  ${Situation_Component}  Change flow status for note@{randomStrList}[0]  timeout=2
    Wait Until Element Contains  ${Situation_Component}  DM1  timeout=2

Open Note form again
    Click Element From Activities List  ${Activities_List}  Test note for automation test@{randomStrList}[0]
    Wait Until Element Is Enabled  ${Note_Form}  timeout=2

Choose another date
    Kolekto Clear Element Text   ${Note_Date_Input}
    Kolekto Date Picker  ${Note_Date}  15-06-2019

Change note
    Kolekto Clear Element Text   ${Note_Description}
    Input Text  ${Note_Description}  Test update note for automation test@{randomStrList}[0]

Switch off the toggle 'Internal'
    Click Element  ${Note_InternalToggle}
    Wait Until Element Is Visible  ${Note_InternalToggle_UnChecked}  timeout=2

Verify Note item in Activities list and Status Component after updating 
    Wait Until Element Contains  ${Activities_List}  Test update note for automation test@{randomStrList}[0]

#HOME VISIT
Open Home visit form
    Click Element  ${Homevisit_Icon}
    Wait Until Element Is Enabled  ${Homevisit_Form}  timeout=2

Specify date and time for Home visit
    Kolekto Clear Element Text   ${Homevisit_Date_Input}
    Kolekto Date Picker  ${Homevisit_Date}  01-07-2019
    Kolekto Clear Element Text   ${Homevisit_Time_Input}
    Kolekto Time Picker  ${Homevisit_Time}  10:00

Add Description
    Input Text  ${Homevisit_Description}  Test Home visit for automation test@{randomStrList}[0]

Select Status 
    Kolekto Dropdown Select From List By Value  ${Homevisit_Status}  Scheduled

Submit for Home visit form
    Click Button  ${Homevisit_Submit}

Verify Home visit item in Activities list 
    Wait Until Element Contains  ${Activities_List}  Test Home visit for automation test@{randomStrList}[0]  timeout=3

Open Home visit form again
    Click Element From Activities List  ${Activities_List}  Test Home visit for automation test@{randomStrList}[0]
    Wait Until Element Is Enabled  ${Homevisit_Form}  timeout=2

Choose another date and time 
    Kolekto Clear Element Text   ${Homevisit_Date_Input}
    Kolekto Date Picker  ${Homevisit_Date}  01-06-2019
    Kolekto Clear Element Text   ${Homevisit_Time_Input}
    Kolekto Time Picker  ${Homevisit_Time}  12:00

Change Description
    Kolekto Clear Element Text   ${Homevisit_Description}
    Input Text  ${Homevisit_Description}  Test update Home visit for automation test@{randomStrList}[0]

Select another Status 
    Kolekto Dropdown Select From List By Value  ${Homevisit_Status}  Completed

Verify Home visit item in Activities list after updating
    Wait Until Element Contains  ${Activities_List}  Test update Home visit for automation test@{randomStrList}[0]

#REGISTER PHONECALL
Open Register phonecall form
    Click Element  ${Phonecall_Icon}
    Wait Until Element Is Enabled  ${Register_Phonecall_Form}  timeout=2

Select direction Incoming
    Click Element  ${Outgoing_Button}

Select Parties involved
    Kolekto People Picker  ${Phonecall_Parties_involved}  Kolekto

Select Subject
    Kolekto Dropdown Select From List By Value  ${Phonecall_Subject}  Payment to client

Specify date and time for Register phonecall
    Kolekto Clear Element Text   ${Phonecall_Date_Input}
    Kolekto Date Picker  ${Phonecall_Date}  01-07-2019
    Kolekto Clear Element Text   ${Phonecall_Time_Input}
    Kolekto Time Picker  ${Phonecall_Time}  10:00

Add Message
    Input Text  ${Phonecall_Message}  Test Register phonecall for automation test@{randomStrList}[0]

Switch on the toggle 'Internal' for Register phonecall form
    Click Element  ${Phonecall_InternalToggle}
    Wait Until Element Is Visible  ${Phonecall_InternalToggle_Checked}  timeout=2

Change flow status for Register phonecall form
    Click Element  ${Phonecall_FlowStatusIcon} 
    Wait Until Element Is Visible  ${Phonecall_Status}  timeout=3
    Kolekto Filter Dropdown Select From List By Value  ${Phonecall_Status}  DM1
    Wait Until Element Is Enabled  ${Phonecall_Status_Description}  timeout=2
    Input Text  ${Phonecall_Status_Description}  Change flow status for phonecall@{randomStrList}[0]

Save for Register phonecall form
    Click Button  ${Phonecall_Save}

Verify phonecall item in Activities list and Status Component
    Wait Until Element Contains  ${Activities_List}  Payment to client  timeout=3
    Wait Until Element Contains  ${Situation_Component}  Change flow status for phonecall@{randomStrList}[0]  timeout=2
    Wait Until Element Contains  ${Situation_Component}  DM1  timeout=2

Open Register phonecall form again
    Click Element From Activities List  ${Activities_List}  Payment to client
    Wait Until Element Is Enabled  ${Register_Phonecall_editForm}  timeout=2
    
Switch off the toggle 'Internal' for Phonecall form
    Click Element  ${Phonecall_InternalToggle}
    Wait Until Element Is Visible  ${Phonecall_InternalToggle_UnChecked}  timeout=2

Submit for Register phonecall form
    Click Button  ${Phonecall_Submit}

Make sure that Register phonecall form is closed 
    Wait Until Element Is Not Visible  ${Register_Phonecall_editForm}  timeout=3
    
Delete phonecall item
    Click Element  ${Phonecall_Delete}
    Wait Until Page Contains Element  ${Phonecall_Delete_Warning}  timeout=2
    Click Element  ${Phonecall_Delete_Confirm}

Verify phonecall item in Activities list 
    Wait Until Element Does Not Contain  ${Activities_List}  Payment to client  timeout=3

#SEND LETTER
Open send letter form
    Click Element  ${Letter_Icon}
    Wait Until Element Is Enabled  ${Send_Letter_Form}  timeout=2

Select date
    Kolekto Clear Element Text   ${Letter_Date_Input}
    Kolekto Date Picker  ${Letter_Date}  10-07-2019

Choose letter template
    Kolekto Filter Dropdown Select From List By Value  ${Letter_Template}  SMS reminder

Select Addressees for Letter form
    Kolekto People Picker  ${Letter_Addressees}  Kolekto

Switch on the toggle 'Internal' for Letter form
    Click Element  ${Letter_InternalToggle}
    Wait Until Element Is Visible  ${Letter_InternalToggle_Checked}  timeout=2

Change flow status for Letter form
    Click Element  ${Letter_FlowStatusIcon} 
    Wait Until Element Is Visible  ${Letter_Status}  timeout=3
    Kolekto Filter Dropdown Select From List By Value  ${Letter_Status}  DM1
    Wait Until Element Is Enabled  ${Letter_Status_Description}  timeout=2
    Input Text  ${Letter_Status_Description}  Change flow status for sending letter@{randomStrList}[0]

Create letter
    Click Button  ${Create_Letter_Button}

Submit letter
    Wait Until Element Is Enabled  ${Letter_Preview}  timeout=10
    Click Button  ${Letter_Submit}

Verify Letter item in Activities list and Status Component
    Wait Until Element Contains  ${Activities_List}  SMS reminder  timeout=10
    Wait Until Element Contains  ${Situation_Component}  Change flow status for sending letter@{randomStrList}[0]  timeout=2
    Wait Until Element Contains  ${Situation_Component}  DM1  timeout=2

Make sure that Send letter form is closed 
    Wait Until Element Is Not Visible  ${Send_Letter_Form}  timeout=3

Open letter item again
    Click Element From Activities List  ${Activities_List}  SMS reminder
    Wait Until Element Is Enabled  ${Letter_Form}  timeout=3

Delete letter item
    Click Button  ${Letter_Delete}
    Wait Until Page Contains Element  ${Letter_ConfirmDelete}  timeout=5
    Click Button  ${Letter_ConfirmDelete}
    Wait Until Element Is Not Visible  ${Letter_Form}  timeout=5

Verify Letter item in Activities list
    Wait Until Element Does Not Contain  ${Activities_List}  SMS reminder  timeout=3

#SEND SMS
Open send SMS form
    Click Element  ${SMS_Icon}
    Wait Until Element Is Visible  ${Send_SMS_Form}  timeout=5
    Wait Until Element Is Not Visible  ${Overlay}  timeout=5

Switch on the toggle 'Internal' for send SMS form
    Click Element  ${SMS_InternalToggle}
    Wait Until Element Is Visible  ${SMS_InternalToggle_Checked}  timeout=2

Select Text message template
    Kolekto Filter Dropdown Select From List By Value  ${SMS_Template}  Client

Wait Addressees field and Message field are populated in SMS form
    Wait Until Element Contains  ${SMS_Addressees}  Kolekto  timeout=5
    Input Text  ${SMS_Additional_PhoneNumber}  +84932733681
    Wait Until Element Contains  ${SMS_Message_Content}  Client  timeout=3
    Kolekto Dropdown Select From List By Value  ${SMS_Message_Name}  Auto DO  

Change flow status for send SMS form
    Click Element  ${SMS_FlowStatusIcon} 
    Wait Until Element Is Visible  ${SMS_Status}  timeout=3
    Kolekto Filter Dropdown Select From List By Value  ${SMS_Status}  DM1
    Wait Until Element Is Enabled  ${SMS_Status_Description}  timeout=2
    Input Text  ${SMS_Status_Description}  Change flow status for sending SMS@{randomStrList}[0]
    
Send SMS
    Click Button  ${SMS_Send_Button}

Verify SMS item in Activities list and Status Component
    Wait Until Element Contains  ${Activities_List}  Auto DO - Client  timeout=3
    Wait Until Element Contains  ${Situation_Component}  Change flow status for sending SMS@{randomStrList}[0]  timeout=2
    Wait Until Element Contains  ${Situation_Component}  DM1  timeout=2

Select Text message template that isn't set receipients 
    Click Element  ${SMS_Template}
    Wait Until Element Is Visible  ${SMS_Kolekto_Filter_Dropdown}  timeout=3
    Click Element  ${SMS_Load_all}
    Wait Until Element Contains  ${SMS_Kolekto_Filter_Dropdown}  Courts  timeout=3
    Click Element  //div[@class='kolekto-filter-dropdown']/div[@class='options']/div[contains(@class,'text-ellipsis option-item')][contains(text(), 'Courts')]  

Select Addressees for SMS form
    Kolekto People Picker  ${SMS_Addressees}  Rotterdam Rotterdam (+84948018747)
    Input Text  ${SMS_Additional_PhoneNumber}  +84932733681
    Wait Until Element Contains  ${SMS_Message_Content}  Test auto for Courts  timeout=3
    Kolekto Dropdown Select From List By Value  ${SMS_Message_Name}  Auto DO

Change flow status (collection) for send SMS form
    Click Element  ${SMS_FlowStatusIcon} 
    Wait Until Element Is Visible  ${SMS_Status}  timeout=3
    Kolekto Filter Dropdown Select From List By Value  ${SMS_Status}  Collection1
    Wait Until Element Is Enabled  ${SMS_Status_Description}  timeout=2
    Input Text  ${SMS_Status_Description}  Change flow status stage Collection for sending SMS@{randomStrList}[0]

Verify SMS item in Activities list and Status Component (Collection)
    Wait Until Element Contains  ${Activities_List}  Auto DO - Test auto for Courts  timeout=3
    Wait Until Element Contains  ${Situation_Component}  Change flow status stage Collection for sending SMS@{randomStrList}[0]  timeout=2
    Wait Until Element Contains  ${Situation_Component}  Collection1  timeout=2

Make sure that Send SMS form is closed
    Wait Until Element Is Not Visible  ${Send_SMS_Form}  timeout=3

Open SMS item again
    Click Element From Activities List  ${Activities_List}  Test auto for Courts
    Wait Until Element Is Visible  ${SMS_Form}  timeout=3

Delete SMS item
    Click Button  ${SMS_Delete}
    Wait Until Page Contains Element  ${SMS_Delete_Warning}  timeout=2
    Click Button  ${SMS_Delete_Confirm}
    Wait Until Element Is Not Visible  ${SMS_Form}  timeout=5

Verify SMS item in Activities list after deleting
    Wait Until Element Does Not Contain  ${Activities_List}  Test auto for Courts  timeout=3

#SEND EMAIL
Open send email form
    Click Element  ${Email_Icon}
    Wait Until Element Is Enabled  ${Send_Email_Form}  timeout=5
    Wait Until Element Is Not Visible  ${Overlay}  timeout=5

Check the From field
    Wait Until Element Contains  ${Email_From}  development@kolekto.nl  timeout=5

Select Email template
    Kolekto Filter Dropdown Select From List By Value  ${Email_Template}  Auto test_Client

Wait Addressees field and Message field are populated in email form
    Wait Until Element Contains  ${Email_Addressees}  Kolekto  timeout=5
    Input Text  ${Email_Additional_Email}  test@gmail.com
    Wait Until Element Contains  ${Email_Message_Content}  Client  timeout=5
    Get Element Attribute  ${Email_Message_Subject}  Auto test with Client

Switch on the toggle 'Internal' for send email form
    Click Element  ${Email_InternalToggle}
    Wait Until Element Is Visible  ${Email_InternalToggle_Checked}  timeout=5
    
Add attachments
    Click Element  ${Email_AttachmentsIcon}
    Sleep  3s
    Kolekto Filter Dropdown Select From List By Value  ${Email_Document_from_Template}  Auto test_Courts
    Wait Until Element Contains  ${Email_Attachments}  Auto test_Courts  timeout=10
    Choose File  ${Email_Upload_Attchements}  D:/SWG/Test data/Courts_all.docx
    Wait Until Element Contains  ${Email_Attachments}  Courts_all.docx  timeout=10

Change flow status for send email form
    Sleep  3s
    Click Element  ${Email_FlowStatusIcon} 
    Wait Until Element Is Visible  ${Email_Status}  timeout=3
    Kolekto Filter Dropdown Select From List By Value  ${Email_Status}  DM1
    Wait Until Element Is Enabled  ${Email_Status_Description}  timeout=5
    Input Text  ${Email_Status_Description}  Change flow status for sending email@{randomStrList}[0]

Send email
    Click Button  ${Email_Send_Button}

Verify email item in Activities list and Status Component
    Wait Until Element Contains  ${Activities_List}  Auto test with Client  timeout=5
    Wait Until Element Contains  ${Situation_Component}  Change flow status for sending email@{randomStrList}[0]  timeout=5
    Wait Until Element Contains  ${Situation_Component}  DM1  timeout=2

Select Email template that isn't set receipients
    Click Element  ${Email_Template}
    Wait Until Element Is Visible  ${Email_Kolekto_Filter_Dropdown}  timeout=3
    Click Element  ${Email_Load_all}
    Wait Until Element Contains  ${Email_Kolekto_Filter_Dropdown}  Auto test_template without recipients  timeout=3
    Click Element  //div[@class='kolekto-filter-dropdown']/div[@class='options']/div[contains(@class,'text-ellipsis option-item')][contains(text(), 'Auto test_template without recipients')]  

Select Addressees and add additional email addresses for Email form
    Kolekto People Picker  ${Email_Addressees}  Rotterdam Rotterdam <linh.mai+1@kolekto.nl>
    Input Text  ${Email_Additional_Email}  test@gmail.com

Check Message block
    Wait Until Element Contains  ${Email_Message_Content}  Auto test_template without recipients  timeout=10
    Get Element Attribute  ${Email_Message_Subject}  Auto test_template without recipients
    Input Text  ${Email_Description}  Sending email auto test@{randomStrList}[0]

Add attachments with selecting document from activities
    Click Element  ${Email_AttachmentsIcon}
    Sleep  3s
    Kolekto Filter Dropdown Select From List By Value  ${Email_Document_from_Activities}  Auto test_Courts
    Click Element  ${Email_Document_from_Template}
    Wait Until Element Is Visible  ${Email_Document_from_Template_Options}  timeout=3
    Click Element  ${Email_Load_all_attachments}
    Wait Until Element Contains  ${Email_Document_from_Template_Options}  Auto test_Addressing and Salutation  timeout=3
    Click Element  //div[@class='kolekto-filter-dropdown']/div[@class='options']/div[contains(@class,'text-ellipsis option-item')][contains(text(), 'Auto test_Addressing and Salutation')]
    Wait Until Element Contains  ${Email_Attachments}  Auto test_Addressing and Salutation  timeout=5
    Choose File  ${Email_Upload_Attchements}  D:/SWG/Test data/Kobiton-Infographic.pdf
    Wait Until Element Contains  ${Email_Attachments}  Kobiton-Infographic.pdf  timeout=5

Change flow status for send email form to Collection stage
    Sleep  2s
    Click Element  ${Email_FlowStatusIcon} 
    Wait Until Element Is Visible  ${Email_Status}  timeout=3
    Kolekto Filter Dropdown Select From List By Value  ${Email_Status}  Collection1
    Wait Until Element Is Enabled  ${Email_Status_Description}  timeout=5
    Input Text  ${Email_Status_Description}  Update flow status for sending email to Collection stage@{randomStrList}[0]

Verify email item in Activities list and Status Component after changing to Collection stage
    Wait Until Element Contains  ${Activities_List}  Sending email auto test@{randomStrList}[0]  timeout=10
    Wait Until Element Contains  ${Situation_Component}  Update flow status for sending email to Collection stage@{randomStrList}[0]  timeout=5
    Wait Until Element Contains  ${Situation_Component}  Collection1  timeout=2

Make sure that Send email form is closed
    Wait Until Element Is Not Visible  ${Email_Form}  timeout=3

Open email item again
    Click Element  xpath://div[@class='eventsContainer']//div[contains(@class, 'eventsPlaceholder')]//div[contains(@class, 'kolekto-detail-row')]//span[contains(@class, 'description')][contains(text(), ('Auto test with Client'))]
    Wait Until Element Is Visible  ${Email_Form}  timeout=3

Delete email item
    Click Button  ${Email_Delete}
    Wait Until Page Contains Element  ${Email_Delete_Warning}  timeout=2
    Click Button  ${Email_Delete_Confirm}
    Wait Until Element Is Not Visible  ${Email_Form}  timeout=5

Verify email item in Activities list after deleting
    Wait Until Element Does Not Contain  ${Activities_List}  Auto test with Client  timeout=3