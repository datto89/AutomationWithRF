*** Settings ***
Documentation   Elements of activites form page

*** Variables ***
${Note_Icon}    xpath://i[@data-icon-name='QuickNote'] 
${Note_Form}    css:.note-form.formContainer
${Note_Date}    css:.kolekto-date
${Note_Date_Input}  css:.kolekto-date input 
${Note_Description}  css:.kolekto-note textarea
${Note_InternalToggle}  xpath://button[@type='button' and @role='switch']
${Note_InternalToggle_Checked}  css:.is-checked.kolekto-internal
${Note_InternalToggle_UnChecked}    css:.kolekto-internal
${Note_Submit}  css:.note-form .form-buttons button.ms-Button--primary
${Activities_List}  css:.eventsContainer
${Note_FlowStatusIcon}  css:.kolekto-status-group
${Note_Status}  xpath://input[@type='text' and @placeholder='Please select flow status...']
${Note_Status_Description}  css:.kolekto-status-description textarea
${Situation_Component}  css:.situation.round-border-hover
${Homevisit_Icon}   xpath://i[@data-icon-name='Home']
${Homevisit_Form}   css:.home-visit-form.formContainer
${Homevisit_Date}   css:.kolekto-date
${Homevisit_Date_Input}  css:.kolekto-date input
${Homevisit_Time}   css:.kolekto-time-picker
${Homevisit_Time_Input}  css:.kolekto-time-picker input
${Homevisit_Description}    css:.kolekto-description textarea
${Homevisit_Status}  css:.kolekto-phonecall-status
${Homevisit_Submit}  css:.home-visit-form .form-buttons button.ms-Button--primary
${Phonecall_Icon}  xpath://i[@data-icon-name='Phone']
${Register_Phonecall_Form}  css:.new-phone-call-form.formContainer
${Register_Phonecall_editForm}  css:.phone-call-form.formContainer
${Incoming_Button}  xpath://div[@class='new-phone-call-form formContainer']//div[contains(@class,'kolekto-direction')]//span[contains(text(), 'Incoming')]
${Outgoing_Button}  xpath://div[@class='new-phone-call-form formContainer']//div[contains(@class,'kolekto-direction')]//span[contains(text(), 'Outgoing')]
${Phonecall_Parties_involved}   css:.to-party.kolekto-to
${Phonecall_Subject}    css:.kolekto-subject
${Phonecall_Date_Input}  css:.kolekto-date input
${Phonecall_Date}  css:.kolekto-date
${Phonecall_Time_Input}  css:.kolekto-time-picker input
${Phonecall_Time}   css:.kolekto-time-picker
${Phonecall_Message}    css:.kolekto-message textarea
${Phonecall_InternalToggle}  xpath://button[@type='button' and @role='switch']
${Phonecall_InternalToggle_Checked}  css:.is-checked.kolekto-internal
${Phonecall_InternalToggle_UnChecked}  css:.kolekto-internal
${Phonecall_FlowStatusIcon}  css:.kolekto-status-group
${Phonecall_Status}  xpath://input[@type='text' and @placeholder='Please select flow status...']
${Phonecall_Status_Description}  css:.kolekto-status-description textarea
${Phonecall_Save}  css:.new-phone-call-form .form-buttons button.ms-Button--primary
${Phonecall_Delete}  xpath://div[@class='phone-call-form formContainer']//div[@class='form-buttons']/button[contains(@class,'ms-Button ms-Button--default')][2]
${Phonecall_Delete_Warning}  xpath://div[@class='phone-call-form formContainer']/form/div[@class='error-box']//div[contains(@class,'ms-MessageBar')]
${Phonecall_Delete_Confirm}  xpath://div[@class='error-box']//div[@class='form-buttons']//button[contains(@class,'ms-Button ms-Button--primary')]
${Phonecall_Submit}  css:.phone-call-form .form-buttons button.ms-Button--primary
${Letter_Icon}  xpath://i[@data-icon-name='TextDocument']
${Send_Letter_Form}  css:.letter-form.formContainer
${Letter_Template}  xpath://input[@type='text' and @placeholder='Please choose letter template...']
${Letter_Addressees}    css:.kolekto-recipients
${Letter_Date_Input}    css:.kolekto-date input
${Letter_Date}  css:.kolekto-date
${Letter_InternalToggle}    xpath://button[@type='button' and @role='switch']
${Letter_InternalToggle_Checked}    css:.is-checked.kolekto-internal
${Letter_FlowStatusIcon}    css:.kolekto-status-group
${Letter_Status}    xpath://input[@type='text' and @placeholder='Please select flow status...']
${Letter_Status_Description}    css:.kolekto-status-description textarea
${Create_Letter_Button}  css:.form-buttons.kolekto-generate-letter-buttons .ms-Button--primary
${Letter_Preview}   css:.letter-preview.kolekto
${Letter_Submit}    css:.form-buttons.kolekto-save-letter-buttons .ms-Button--primary
${Letter_Form}  css:.letter-activity.formContainer.kolekto-form
${Letter_Delete}  xpath://div[@class='letter-activity formContainer kolekto-form']//button[contains(@class,'ms-Button')][2]
${Letter_ConfirmDelete}  css:.delete-Button
${SMS_Icon}  xpath://i[@data-icon-name='Message']
${Send_SMS_Form}    css:.sendEmailForm.formContainer
${SMS_InternalToggle}    xpath://button[@type='button' and @role='switch']
${SMS_InternalToggle_Checked}  css:.is-checked.kolekto-internal-activity
${SMS_InternalToggle_UnChecked}  css:.kolekto-internal-activity
${SMS_Template}  css:.filter-text
${SMS_Addressees}   css:.kolekto-recipients
${SMS_Additional_PhoneNumber}  xpath://div[@class='sendEmailForm formContainer']//div[contains(@class,'ms-TextField')]//input[@placeholder='Additional phone numbers']
${SMS_Message_Name}  css:.kolekto-sender
${SMS_Message_Content}  css:.kolekto-message
${SMS_FlowStatusIcon}  css:.kolekto-status-group 
${SMS_Status}  xpath://input[@type='text' and @placeholder='Please select flow status...']
${SMS_Status_Description}  css:.kolekto-status-description textarea
${SMS_Send_Button}  css:.form-buttons .ms-Button--primary
${SMS_Form_Buttons}  css:.form-buttons
${SMS_Kolekto_Filter_Dropdown}  css:.kolekto-filter-dropdown .options
${SMS_Load_all}  xpath://div[@class='sendEmailForm formContainer']//div[@class='kolekto-filter-dropdown']/div[@class='options']/div[@class='btn-loadAll']
${SMS_Delete}  xpath://div[@class='dossier-config-form formContainer']/form/div[@class='form-buttons']/button[contains(@class,'ms-Button')][3]
${SMS_Delete_Warning}  css:.discardBox
${SMS_Delete_Confirm}  xpath://div[@class='dossier-config-form formContainer']//div[@class='discardBox']//button[contains(@class,'ms-Button')][1]
${SMS_Form}  css:.dossier-config-form.formContainer
${Email_Icon}  xpath://i[@data-icon-name='Mail']
${Send_Email_Form}  css:.sendEmailForm.formContainer
${Email_From}   css:.sendEmailForm.formContainer .ms-Dropdown-container
${Email_Template}   css:.filter-text
${Email_Addressees}  css:.kolekto-email-addresses
${Email_Additional_Email}   css:.kolekto-additional-emails input
${Email_Message_Content}    css:.kolekto-message
${Email_Message_Subject}  xpath://div[@class='sendEmailForm formContainer']//div[contains(@class,'kolekto-subject')]//input[@type='text']
${Email_InternalToggle}  xpath://button[@type='button' and @role='switch']
${Email_InternalToggle_Checked}  css:.is-checked.kolekto-internal-activity
${Email_AttachmentsIcon}  css:.kolekto-attachment .foldable-group
${Email_Document_from_Template}  xpath://div[@class='kolekto-attachment']//input[contains(@type,'text') and contains(@placeholder, 'Generate document from template...')]
${Email_Upload_Attchements}  css:.filepicker.kolekto-file-picker input
${Email_File_Letter_View}  css:.kolekto-letter-preview.contain-data
${Email_File_View}  css:.file-view.contain-data
${Email_FlowStatusIcon}  css:.kolekto-dossier-status .foldable-group
${Email_Status}  css:.kolekto-dossier-status .kolekto-filter-dropdown
${Email_Status_Description}  css:.kolekto-status-description textarea
${Email_Send_Button}    css:.form-buttons .kolekto-send
${Email_Attachments}    css:.kolekto-attachment
${Email_Kolekto_Filter_Dropdown}  css:.sendEmailForm.formContainer .kolekto-filter-dropdown .options
${Email_Load_all}  xpath://div[@class='sendEmailForm formContainer']//div[@class='kolekto-filter-dropdown']/div[@class='options']/div[@class='btn-loadAll']
${Email_Description}  css:.kolekto-additional-descr input
${Email_Document_from_Activities}  xpath://div[@class='kolekto-attachment']//input[contains(@type,'text') and contains(@placeholder, 'Select document from activities...')]
${Email_Document_from_Template_Options}  xpath://div[@class='sendEmailForm formContainer']//div[@class='kolekto-attachment']//div[@class='kolekto-filter-dropdown'][2]/div[@class='options']
${Email_Load_all_attachments}  xpath://div[@class='sendEmailForm formContainer']//div[@class='kolekto-attachment']//div[@class='kolekto-filter-dropdown'][2]/div[@class='options']/div[@class='btn-loadAll']
${Email_Form}  css:.dossier-config-form.formContainer
${Email_Delete}  xpath://div[@class='dossier-config-form formContainer']/form/div[@class='form-buttons']/button[contains(@class,'ms-Button')][3]
${Email_Delete_Warning}  css:.discardBox
${Email_Delete_Confirm}  xpath://div[@class='dossier-config-form formContainer']//div[@class='discardBox']//button[contains(@class,'ms-Button')][1]
${Overlay}  css:.sendEmailForm.formContainer .overlay