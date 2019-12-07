*** Settings ***
Documentation   Elements of add/update contact page

*** Variables ***
${ContactList}              css:.contact-items
${CreateContactButton}      name:Create contact  
${AddContactForm}           css:.contact-form.formContainer
${ContactTypeIcon}          xpath://i[@data-icon-name='Contact']
${CompanyTypeIcon}          xpath://i[@data-icon-name='EMI']
${BailiffTypeIcon}          xpath://i[@data-icon-name='PartyLeader']
${InitialsField}            css:.initial input
${FirstNameField}           css:.firstname input
${PrefixField}              css:.prefix input
${LastNameField}            css:.lastname input
${CompanyField}             xpath://div[@class='contact-form formContainer']//input[contains(@type,'text') and contains(@placeholder, 'Company')]
${CompanyListField}         css:.kolekto-filter-dropdown
${PhoneNumberField}         css:.phone-number input
${MobilePhoneField}         css:.mobile-number input
${EmailAddressField}        css:.email input
${PostalCodeField}          css:.post-code input
${NumberField}              css:.number input
${AdditionField}            css:.additional-number input
# ${AddressField}             xpath://div[@class='contact-form formContainer']/form/div[@class='form-validation']/div/div[@class='kolekto-address']/div[@class='large-screen']/div[@class='ms-Grid-row'][3]/div[@class='ms-Grid-col ms-sm3 ms-md4 ms-lg4 disabled']//input
# ${CityField}                xpath://div[@class='contact-form formContainer']/form/div[@class='form-validation']/div/div[@class='kolekto-address']/div[@class='large-screen']/div[@class='ms-Grid-row'][4]/div[@class='ms-Grid-col ms-sm3 ms-md4 ms-lg4 disabled']//input
${AddressField}             xpath://div[@class='kolekto-address']//label[.='Address']/../..//input
${CityField}                xpath://div[@class='kolekto-address']//label[.='City']/../..//input
${SubmitAddContact}         css:.contact-form .form-buttons button.ms-Button--primary
${CompanyName}              css:.company-name input
${KVK}                      css:.kvk input
${LegalForm_Company}        css:.kolekto-dropdown-placeholder
${LegalForm_CompanyListField}   css:.kolekto-dropdown
${TradeName}                css:.trade-name input
${Rate}                     css:.rate input
${AddBankAccountIcon}       xpath://div[@class='bank-list-holder']/div[@class='link-icon']/a
${Contact_AccountHolder}    css:.bank-account-name input
${Contact_IBAN}             css:.bank-account-number input
#${ContactBankAccount_RelatedListField}  xpath://div[@class='bankinfo formContainer']//div[@class='kolekto-dropdown-placeholder']
${ContactBankAccount_RelatedListField}  //div[@class='bankinfo kolekto-form']//div[@class='kolekto-dropdown-placeholder']
${ContactBankAccount_DescriptionField}  css:.bank-account-description textarea
#${PrimaryCheckbox}          css:button.primary-account
${PrimaryCheckbox}  //div[@class='bankinfo kolekto-form']//i[@data-icon-name='CheckMark']  #Can not click on input tag 
${ContactBankAccount_Submit}    css:.bankinfo .form-buttons button.ms-Button--primary    
${Contact_BankAccount_list}      css:.bank-list   
${Contact_BankAccount_Item}     //div[@class='bank-list']/div[contains(@class,'bank-account')]/div[contains(@class, 'account-number')][contains(text(), 'KL11 TO22 3344 5566')]
${Contact_Search_Box}       css:.searchBox input
${BankInfoForm}             css:.bankinfo.formContainer
${Contact_Delete}           xpath://div[@class='bankinfo formContainer']/form/div[@class='form-buttons']/button[3]
${Contact_ConfirmDelete}    css:.delete-Button
${Address_Street}   xpath://div[@class='contact-form formContainer']//div[contains(@class,'street')]//input[contains(@class,'ms-TextField-field')]
${Address_City}   xpath://div[@class='contact-form formContainer']//div[contains(@class,'city')]//input[contains(@class,'ms-TextField-field')]