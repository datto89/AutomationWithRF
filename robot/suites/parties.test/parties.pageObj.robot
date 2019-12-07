*** Settings ***
Documentation   Elements of parties form page

*** Variables ***
${DossierOverview}  css:.dossierContentContainer
${Add_Party_Button}  xpath://i[@class='ms-Icon ms-Icon--AddFriend']
${Parties_List}  css:.partyContainer
${AddParty_Form}  css:.formContainer.add-party
${New_Contact_Button}  xpath://div[@class='formContainer add-party']/form/button[contains(@class,'ms-Button ms-Button--default')][1]
${Party_Form}  css:.formContainer.details-party-form
${Party_Role}  css:.kolekto-role-selector
${Party_Company_RadioButton}  xpath://i[@data-icon-name='EMI']
${Party_Contact_RadioButton}  xpath://i[@data-icon-name='Contact']
${Party_Beneficiary_Toggle}  xpath://button[@type='button' and @role='switch']
${Party_Beneficiary_Toggle_Checked}  css:.is-checked.kolekto-beneficiary
${Party_Company_Name}  css:.kolekto-company-name input
${Party_KVK}  css:.kolekto-kvk input
${Party_Legal_Form}  css:.legal-form-selector.kolekto
${Party_PostalCode}  css:.post-code input
${Party_Number}  css:.number input
${Party_Addition}  css:.additional-number input
${Party_Street}  css:.street
${Party_City}  css:.city
${Party_PhoneNumber}  css:.kolekto-com-phone-number input
${Party_MobileNumber}  css:.kolekto-com-mobile-number input
${Party_EmailAddress}  css:.kolekto-com-email-address input
${Party_Submit}  xpath://div[@class='form-buttons']/button[contains(@class,'ms-Button')][1]
${Party_Initials}  css:.kolekto-initials input
${Party_Firstname}  css:.kolekto-firstname input
${Party_Prefix}  css:.kolekto-prefix input
${Party_Lastname}  css:.kolekto-lastname input
${Party_DateofBirth}  css:.kolekto-birthdate
${Party_Gender}  css:.kolekto-gender
${Party_TradeName}  css:.kolekto-trade-name input
${Party_POBox}  css:.kolekto-address .po-box
${Party_POBox_Checked}  css:.is-checked.po-box
${Party_Group}  css:.kolekto-role
${Party_Contact_List}  xpath://div[@class='kolekto-filter-dropdown']//input[@placeholder='Search contact by name or address']
${Party_Contact_ListOptions}  css: .kolekto-filter-dropdown .options
${Party_Next}  css:.kolekto-next
${Party_Detais_Form}  css:.formContainer.details-party-form
${Party_AccountHolder}  css:.bank-account-name input
${Party_IBAN}  css:.bank-account-number input
${Party_City_POBox}  css:.city input
${Party_SaveChanges_Toggle}  xpath://label[text()="Save changes to contact list"]/preceding-sibling::button[@type='button' and @role='switch']
${Party_Delete}  xpath://div[@class='formContainer details-party-form']/form/div[@class='form-buttons']/button [3]
${Party_Confirm}  css:.delete-Button
${Party_Header_AddPartyForm}  css:.form-header
${Party_Company_WholeRadioButton}  css:.kolekto-company
${Party_Cancel_Button}  xpath://div[@class='form-buttons']/button[contains(@class,'ms-Button')][2]
${Party_Street_Compare}  xpath://div[@class='kolekto-address']//div[contains(@class,'street')]//input[contains(@class,'ms-TextField')]
${Party_City_Compare}  xpath://div[@class='kolekto-address']//div[contains(@class,'city')]//input[contains(@class,'ms-TextField')]
${Property_Block}   css:.property-holder.round-border-hover.editable
${Property_Form}    css:.dossier-config-form.formContainer
${Property_PostCode}    css:.post-code
${Property_PostCode_Input}  css:.post-code input
${Property_Number}  css:.number
${Property_Number_Input}    css:.number input
${Property_Addition}  css:.additional-number
${Property_Addition_Input}  css:.additional-number input
${Property_Street}  xpath://div[@class='dossier-config-form formContainer']//div[contains(@class,'street')]//input[contains(@class,'ms-TextField-field')]
${Property_City}  xpath://div[@class='dossier-config-form formContainer']//div[contains(@class,'city')]//input[contains(@class,'ms-TextField-field')]
${Property_Submit}  xpath://div[@class='dossier-config-form formContainer']//button[contains(@class,'ms-Button')][1]
${Court_Field}  css:.kolekto-court
${Court_Field_Compare}  xpath://div[@class='formContainer add-party']//div[contains(@class,'kolekto-court dropdown')]//span[contains(@class,'ms-Dropdown-title')]
${CourtLocation_Field}  css:.kolekto-court-location
${CourtLocation_Field_Compare}  xpath://div[@class='formContainer add-party']//div[contains(@class,'kolekto-court-location')]//span[contains(@class,'ms-Dropdown-title')]
${Court_Details}    xpath://i[@data-icon-name='ChevronDown'][contains(@class,'ms-Button-icon')]
${Court_Info}   css:.kolekto-court-info
${Court_Cancel}  xpath://div[@class='formContainer add-party']//button[contains(@class,'ms-Button--default')]
${Court_Submit}  xpath://div[@class='formContainer add-party']//button[contains(@class,'ms-Button--primary')]
${Court_Form}  css:.formContainer.add-party
${Party_External_Ref}  css:.kolekto-debtor-number input
${Party_Insolvent_Toggle}  xpath://div[contains(@class,'kolekto-debtor-insolvent')]//button[@type='button' and @role='switch']
${Party_Insolvent_Toggle_Checked}  css:.is-checked.kolekto-debtor-insolvent
${Party_Deceased_Toggle}  xpath://div[contains(@class,'kolekto-debtor-deceased')]//button[@type='button' and @role='switch']
${Party_Deceased_Toggle_Checked}  css:.is-checked.kolekto-debtor-deceased
${Party_Insolvent_Warning}  css:.dossierContentContainer .insolvency-warning
${Party_Insolvency_Note}  css:.kolekto-debtor-insolvent-note textarea
${Party_Insolvent_Date}  css:.kolekto-debtor-insolvent-date
${Party_Deceased_Date}  css:.kolekto-debtor-deceased-date