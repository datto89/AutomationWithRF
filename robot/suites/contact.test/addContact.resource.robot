
*** Settings ***
Documentation       Data of add/update contact test suite
Library             DateTime
Library             String
Library             BuiltIn
Library             SeleniumLibrary
Resource            ../../keywords/kolekto.robot
Resource            ./addContact.pageObj.robot

*** Keywords ***
Setup Contact Test Suite
    Login and change language
    Setup Contact Test Suite Variables

Setup Contact Test Suite Variables
    ${randomStr}  Generate Random String   8   [NUMBERS]
    Set Suite Variable  @{randomStrList}  ${randomStr}
    
Open Add Contact form
    Click Button  ${CreateContactButton}

Complete Add Contact form
    Input Text  ${InitialsField}  AUTO
    Input Text  ${FirstNameField}  Linh
    Input Text  ${PrefixField}  Test
    Input Text  ${LastNameField}  Auto Test@{randomStrList}[0]
    Kolekto Filter Dropdown Select From List By Value  ${CompanyListField}  Kolekto    
    Kolekto Dropdown Select From List By Value  ${LegalForm_CompanyListField}  Sole proprietor
    Input Text  ${TradeName}  Test123
    Input Text  ${PhoneNumberField}  ${PhoneNumber1} 
    Input Text  ${MobilePhoneField}  ${MobilePhone1}
    Input Text  ${EmailAddressField}  ${EmailAddress1}
    Input Text  ${PostalCodeField}  1111ab   
    Input Text  ${NumberField}  11
    Input Text  ${AdditionField}  A


Complete Add Contact Company form
    Click Element  ${CompanyTypeIcon}
    Wait Until Page Contains  Company name  timeout=3 
    Input Text  ${CompanyName}  Auto Test Company@{randomStrList}[0]
    Input Text  ${KVK}  Company@{randomStrList}[0]
    Kolekto Dropdown Select From List By Value  ${LegalForm_CompanyListField}  Public limited company
    Input Text  ${PhoneNumberField}  ${PhoneNumber1} 
    Input Text  ${MobilePhoneField}  ${MobilePhone1}
    Input Text  ${EmailAddressField}  ${EmailAddress1}
    Input Text  ${PostalCodeField}  3011na   
    Input Text  ${NumberField}  20
    Input Text  ${AdditionField}  B    

Complete Add Contact Bailiff form
    Click Element  ${BailiffTypeIcon}
    Wait Until Page Contains  Bailiff  timeout=3 
    Input Text  ${CompanyName}  Auto Test Bailiff@{randomStrList}[0]
    Input Text  ${KVK}  Bailiff@{randomStrList}[0]
    Input Text  ${PhoneNumberField}  ${PhoneNumber1} 
    Input Text  ${MobilePhoneField}  ${MobilePhone1}
    Input Text  ${EmailAddressField}  ${EmailAddress1}
    Input Text  ${Rate}  555
    Input Text  ${PostalCodeField}  2909lg   
    Input Text  ${NumberField}  11
    Input Text  ${AdditionField}  C

Wait Address and City Are Filled
    Wait Until Element Is Visible  ${AddressField}  timeout=5

Click Button Submit
    Click Button  ${SubmitAddContact}

Add Contact form is closed
    Wait Until Page Does Not Contain Element  ${AddContactForm}  timeout=3

Contact Person is added to Contact list 
    Wait Until Element Contains  ${ContactList}  Auto Test@{randomStrList}[0]  timeout=3

Contact Company is added to Contact list
    Wait Until Element Contains  ${ContactList}  Auto Test Company@{randomStrList}[0]  timeout=3

Contact Bailiff is added to Contact list
    Wait Until Element Contains  ${ContactList}  Auto Test Bailiff@{randomStrList}[0]  timeout=3

Wait Contact Company form appears
    Wait Until Element Is Visible  ${AddContactForm}  timeout=2

Wait Contact Bailiff form appears
    Wait Until Element Is Visible  ${AddContactForm}  timeout=2

Open again the contact person just added
    Click Element From Contacts List  ${ContactList}  Auto Test@{randomStrList}[0]
    Wait Until Page Contains  Edit contact  timeout=2

Clear text in the fiels in Edit contact person form
    Kolekto Clear Element Text   ${InitialsField}
    Kolekto Clear Element Text   ${FirstNameField}
    Kolekto Clear Element Text   ${PrefixField}
    Kolekto Clear Element Text   ${LastNameField} 
    Kolekto Clear Element Text   ${TradeName}
    Kolekto Clear Element Text   ${PhoneNumberField}
    Kolekto Clear Element Text   ${MobilePhoneField}
    Kolekto Clear Element Text   ${EmailAddressField}
    Kolekto Clear Element Text   ${PostalCodeField}
    Set Focus To Element  ${PostalCodeField}
    Input Text  ${PostalCodeField}  1188jb      # Delete after fixed
    Kolekto Clear Element Text   ${NumberField}
    Sleep  1s
    Input Text  ${NumberField}  44      # Delete after fixed
    Sleep  1s
    Kolekto Clear Element Text   ${AdditionField}
    Sleep  1s
    Input Text  ${AdditionField}  YY    # Delete after fixed

Input new text into Edit contact person form
    Input Text  ${InitialsField}  AUTO
    Input Text  ${FirstNameField}  Linh-edited
    Input Text  ${PrefixField}  Test-edited
    Input Text  ${LastNameField}  Auto-edited Test@{randomStrList}[0]
    Kolekto Filter Dropdown Select From List By Value  ${CompanyListField}  Idealogic
    Kolekto Dropdown Select From List By Value  ${LegalForm_CompanyListField}  Professional partnership  
    Input Text  ${TradeName}  Test123-edited
    Input Text  ${PhoneNumberField}  ${PhoneNumber2}
    Input Text  ${MobilePhoneField}  ${MobilePhone2}
    Input Text  ${EmailAddressField}  ${EmailAddress2}
    # Input Text  ${PostalCodeField}  1188jb   
    # Input Text  ${NumberField}  44
    # Input Text  ${AdditionField}  YY

Edit Contact form is closed
    Wait Until Page Does Not Contain Element  ${AddContactForm}  timeout=3

Contact Person is edited in Contact list
    Wait Until Element Contains  ${ContactList}  Auto-edited Test@{randomStrList}[0]  timeout=3
    
Open again the contact company just added
    Click Element From Contacts List  ${ContactList}  Auto Test Company@{randomStrList}[0]
    Wait Until Page Contains  Edit contact  timeout=2

Clear text in the fiels in Edit contact company form
    Kolekto Clear Element Text   ${CompanyName}
    Kolekto Clear Element Text   ${KVK}
    Kolekto Clear Element Text   ${PhoneNumberField}
    Kolekto Clear Element Text   ${MobilePhoneField}
    Kolekto Clear Element Text   ${EmailAddressField}
    Kolekto Clear Element Text   ${PostalCodeField}
    Kolekto Clear Element Text   ${NumberField}
    Kolekto Clear Element Text   ${AdditionField}
   

Input new text into Edit contact company form
    Input Text  ${CompanyName}  Auto Test Company-edited@{randomStrList}[0]
    Input Text  ${KVK}  Company-edited@{randomStrList}[0]
    Kolekto Dropdown Select From List By Value  ${LegalForm_CompanyListField}  Private limited company
    Input Text  ${PhoneNumberField}  ${PhoneNumber2} 
    Input Text  ${MobilePhoneField}  ${MobilePhone2}
    Input Text  ${EmailAddressField}  ${EmailAddress2}
    Input Text  ${PostalCodeField}  2909lg   
    Input Text  ${NumberField}  11
    Input Text  ${AdditionField}  C

Contact Company is edited in Contact list
    Wait Until Element Contains  ${ContactList}  Auto Test Company-edited@{randomStrList}[0]

Open again the contact bailiff just added
    Click Element From Contacts List  ${ContactList}  Auto Test Bailiff@{randomStrList}[0]
    Wait Until Page Contains  Edit contact  timeout=2

Clear text in the fiels in Edit contact bailiff form
    Kolekto Clear Element Text   ${CompanyName}
    Kolekto Clear Element Text   ${KVK}
    Kolekto Clear Element Text   ${PhoneNumberField}
    Kolekto Clear Element Text   ${MobilePhoneField}
    Kolekto Clear Element Text   ${EmailAddressField}
    Kolekto Clear Element Text   ${PostalCodeField}
    Kolekto Clear Element Text   ${NumberField}
    Kolekto Clear Element Text   ${AdditionField}
    Kolekto Clear Element Text   ${Rate} 

Input new text into Edit contact bailiff form
    Input Text  ${CompanyName}  Auto Test Bailiff-edited@{randomStrList}[0]
    Input Text  ${KVK}  Bailiff-edited@{randomStrList}[0]
    Input Text  ${PhoneNumberField}  ${PhoneNumber2} 
    Input Text  ${MobilePhoneField}  ${MobilePhone2}
    Input Text  ${EmailAddressField}  ${EmailAddress2}
    Input Text  ${Rate}  666
    Input Text  ${PostalCodeField}  1111ab   
    Input Text  ${NumberField}   11   
    Input Text  ${AdditionField}  S
    
Contact Bailiff is edited in Contact list
    Wait Until Element Contains  ${ContactList}  Auto Test Bailiff-edited@{randomStrList}[0]

Complete Add bank account form
    Scroll Element Into View  ${AddBankAccountIcon}   #If test on smaller screen , need this action to move to the element
    Click Element  ${AddBankAccountIcon}  
    Wait Until Page Contains  Bank account  timeout=2
    Input Text  ${Contact_AccountHolder}  Linh Mai
    Input Text  ${Contact_IBAN}  LM12TE3456789000
    Kolekto Dropdown Select From List By Value  ${ContactBankAccount_RelatedListField}  Dell LTM
    Wait Until Element Is Visible  ${ContactBankAccount_DescriptionField}  timeout=2
    Input Text  ${ContactBankAccount_DescriptionField}  Test adding bank account for Contact person
    #L Click Button  ${PrimaryCheckbox}   <<<< Cannot click anymore
    Click Element  ${PrimaryCheckbox}
    Click Button  ${ContactBankAccount_Submit}

Check bank account after added
    Wait Until Element Contains  ${Contact_BankAccount_list}  LM12 TE34 5678 9000  timeout=3
    Wait Until Element Contains  ${Contact_BankAccount_list}  Linh Mai  timeout=3
    Wait Until Element Contains  ${Contact_BankAccount_list}  Dell LTM  timeout=3
    Wait Until Element Contains  ${Contact_BankAccount_list}  Test adding bank account for Contact person  timeout=3

Complete Add another bank account
    Click Element  ${AddBankAccountIcon}  
    Wait Until Page Contains  Bank account  timeout=2
    Input Text  ${Contact_AccountHolder}  Kolekto
    Input Text  ${Contact_IBAN}  KL11TO2233445566
    Kolekto Dropdown Select From List By Value  ${ContactBankAccount_RelatedListField}  Idealogic
    Wait Until Element Is Visible  ${ContactBankAccount_DescriptionField}  timeout=2
    Input Text  ${ContactBankAccount_DescriptionField}  Test adding another bank account for Contact person
    Click Button  ${ContactBankAccount_Submit}

Check another bank account after added
    Wait Until Element Contains  ${Contact_BankAccount_list}  KL11 TO22 3344 5566  timeout=3
    Wait Until Element Contains  ${Contact_BankAccount_list}  Kolekto  timeout=3
    Wait Until Element Contains  ${Contact_BankAccount_list}  Idealogic  timeout=3
    Wait Until Element Contains  ${Contact_BankAccount_list}  Test adding another bank account for Contact person  timeout=3

Edit Add bank account form
    Click Element  ${Contact_BankAccount_Item}  
    Wait Until Page Contains  Bank account  timeout=2
    Kolekto Clear Element Text   ${Contact_AccountHolder} 
    Kolekto Clear Element Text   ${Contact_IBAN}
    Kolekto Clear Element Text   ${ContactBankAccount_DescriptionField}
    Input Text  ${Contact_AccountHolder}  Kolekto_edited
    Input Text  ${Contact_IBAN}  KL11TO22334455660000
    Kolekto Dropdown Select From List By Value  ${ContactBankAccount_RelatedListField}  Finance
    Wait Until Element Is Visible  ${ContactBankAccount_DescriptionField}  timeout=2
    Input Text  ${ContactBankAccount_DescriptionField}  Test editing bank account for Contact person
    Click Button  ${ContactBankAccount_Submit}

Check bank account after edited
    Wait Until Element Contains  ${Contact_BankAccount_list}  KL11 TO22 3344 5566 0000  timeout=3
    Wait Until Element Contains  ${Contact_BankAccount_list}  Kolekto_edited  timeout=3
    Wait Until Element Contains  ${Contact_BankAccount_list}  Finance  timeout=3
    Wait Until Element Contains  ${Contact_BankAccount_list}  Test editing bank account for Contact person  timeout=3

Search Contact Person Item in contact list
    Input Text  ${Contact_Search_Box}  Auto Test@{randomStrList}[0]

Search Contact Person Item in contact list after editing
    Input Text  ${Contact_Search_Box}  Auto-edited Test@{randomStrList}[0]

Search Contact Company Item in contact list
    Input Text  ${Contact_Search_Box}  Company@{randomStrList}[0]

Search Contact Company Item in contact list after editing
    Input Text  ${Contact_Search_Box}  Company-edited@{randomStrList}[0]

Search Contact Bailiff Item in contact list
    Input Text  ${Contact_Search_Box}  Bailiff@{randomStrList}[0]

Search Contact Bailiff Item in contact list after editing
    Input Text  ${Contact_Search_Box}  Bailiff-edited@{randomStrList}[0]

Clear text in Search box
    Kolekto Clear Element Text   ${Contact_Search_Box}

Open again the contact person just edited
    Click Element From Contacts List  ${ContactList}  Auto-edited Test@{randomStrList}[0]
    Wait Until Page Contains  Edit contact  timeout=2

Open again the contact company just added just edited
    Click Element From Contacts List  ${ContactList}  Company-edited@{randomStrList}[0]
    Wait Until Page Contains  Edit contact  timeout=2

Open again the contact bailiff just added just edited
    Click Element From Contacts List  ${ContactList}  Bailiff-edited@{randomStrList}[0]
    Wait Until Page Contains  Edit contact  timeout=2

Delete bank account
    Click Element  ${Contact_BankAccount_Item}  
    Wait Until Page Contains  Bank account  timeout=2
    Click Button  ${Contact_Delete}
    Wait Until Page Contains Element  ${Contact_ConfirmDelete}  timeout=2
    Click Button  ${Contact_ConfirmDelete}
    Wait Until Element Is Not Visible  ${BankInfoForm}  timeout=5

Check bank account after deleted
    Wait Until Element Does Not Contain  ${Contact_BankAccount_list}  KL11 TO22 3344 5566 0000  timeout=2
