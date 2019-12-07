*** Settings ***
Documentation   Elements of add/update templates page

*** Variables ***

${Add_Category_Button}  xpath://div[contains(@class,'kolekto-list-view kolekto-categories')]//i[@class='ms-Icon ms-Icon--Add']
${Add_Category_Form}  css:.template-category-form.formContainer
${Edit_Category_Form}  css:.template-category-form.formContainer
${Category_Delete_Warning}  xpath://div[contains(@class,'kolekto-categories')]//div[contains(@class,'ms-MessageBar')]
${Category_Warning_Cancel}  xpath://div[contains(@class,'kolekto-categories')]//div[contains(@class,'ms-MessageBar')]//button[contains(@class,'ms-Button--default')]
${Category_Warning_Confirm}  xpath://div[contains(@class,'kolekto-categories')]//div[contains(@class,'ms-MessageBar')]//button[contains(@class,'ms-Button--primary')]
${Category_Name}  css:.kolekto-template-category input
${Category_Submit_Button}  css:.template-category-form.formContainer .ms-Button--primary
${Category_List}  css:.kolekto-list-view
${Add_SMS_Button}  xpath://div[contains(@class,'kolekto-list-view kolekto-text-message-templs')]//i[@class='ms-Icon ms-Icon--Add']
#${Add_SMS_Form}  css:.sms-template-form.formContainer
${Add_SMS_Form}  css:.sms-template-form.kolekto-form
#${SMS_ChooseFile}  xpath://div[@class='sms-template-form formContainer']//div[@class='file-picker kolekto']//input[@type='file']
${SMS_ChooseFile}  //input[contains(@placeholder,'file')]
#LoadingSpinner  //div[contains(@class,'sms-template-form')]//div[contains(@class,'ms-Spinner')]
${Template_Name}  css:.kolekto-templ-name input
${Template_Category}    css:.kolekto-templ-category
${Template_Recipient_Group}  css:.kolekto-recipient-groups
${Template_Process}  css:.kolekto-stage
${Template_Dossier_Type}  css:.kolekto-dossier-type
${Template_Action_Type}  css:.kolekto-action-type-selector
${SMS_Template_List}    css:.kolekto-list-view.kolekto-text-message-templs
${SMS_Template_Submit_Button}   //div[contains(@class,'sms-template-form')]//button[contains(@class,'primary')]
${Template_DoubleChevronDown_Icon}  xpath://i[@data-icon-name='DoubleChevronDown']
${Template_PreviewFile}  css:.file-preview
${Template_FileView_Block}  css:.file-view.kolekto-templ-view.contain-data
${Template_Confirm_Box}  css:.kolekto-list-view .confirmBox
${Template_Confirm_Box_YesButton}  css:.kolekto-list-view .confirmBox .ms-Button.ms-Button--primary
${Add_Letter_Button}  xpath://div[contains(@class,'kolekto-list-view kolekto-letter-templs')]//i[@class='ms-Icon ms-Icon--Add']
${Add_Letter_Form}  css:.letter-template-form.formContainer
${Letter_ChooseFile}  xpath://div[@class='letter-template-form formContainer']//div[@class='file-picker kolekto']//input[@type='file']
${Letter_Template_Submit_Button}  css:.letter-template-form.formContainer .ms-Button--primary
${Letter_Template_List}  css:.kolekto-list-view.kolekto-letter-templs
${Add_Email_Button}  xpath://div[contains(@class,'kolekto-list-view kolekto-email-templs')]//i[@class='ms-Icon ms-Icon--Add']
${Add_Email_Form}  css:.email-template-form.formContainer
${Email_ChooseFile}  xpath://div[@class='email-template-form formContainer']//div[@class='file-picker kolekto']//input[@type='file']
${Template_Subject}  css:.kolekto-templ-subject input
${Email_Template_Submit_Button}  css:.email-template-form.formContainer .ms-Button--primary
${Email_Template_List}  css:.kolekto-list-view.kolekto-email-templs
