*** Settings ***
Documentation   Elements of add/update process flow

*** Variables ***
${Add_DossierType_Icon}  xpath://div[contains(@class,'kolekto-list-view kolekto-')]//i[@class='ms-Icon ms-Icon--Add']
${DossierType_Form}  css:.dossier-type-form.formContainer
${DossierType_Name}  css:.kolekto-dossier-type-name input
${DossierType_Purpose}  css:.kolekto-dossier-type-descr textarea
${DossierType_Save_Button}  css:.dossier-type-form.formContainer .ms-Button--primary
${DossierType_List}  css:.kolekto-list-view.kolekto-
${Edit_Process}
${Flow_Management}  css:.view.flow-management.scrollable-content
${Process_DM_Add_Icon}  xpath://div[@class='view flow-management scrollable-content']/div[@class='view'][1]//i[@class='ms-Icon ms-Icon--Add']
${Process_Add_Action_Form}  css:.flow-action-form.formContainer
${Process_Action_Type}  xpath://div[@class='flow-action-form formContainer']//input[@placeholder='Choose action type']
${Process_Action_Name}  css:.kolekto-action-name input
${Process_Action_Description}  css:.kolekto-action-descr textarea
${Process_Action}   css:.kolekto-sys-action
${Process_Template_Email}  xpath://div[@class='flow-action-form formContainer']//input[@placeholder='Please choose a template...']
${Process_Template_Letter}  xpath://div[@class='flow-action-form formContainer']//input[@placeholder='Please choose a template for attachment...']
${Process_Schedule_Delay}  css:.kolekto-action-schedule-delay input
${Process_Action_Completed}  css:.kolekto-action-next-status
${Process_Action_Save_Button}  css:.flow-action-form.formContainer .ms-Button--primary
${Process_ActionType_Toggle}  xpath:xpath://button[@type='button' and @role='switch']
${Process_ActionType_Toggle_Checked}  css:.is-checked.kolekto-action-auto
${Process_Collection_Add_Icon}  xpath://div[@class='view flow-management scrollable-content']/div[@class='view'][2]//i[@class='ms-Icon ms-Icon--Add']