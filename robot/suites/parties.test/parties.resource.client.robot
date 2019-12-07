*** Settings ***
Documentation       Data of parties test suite
Library             DateTime
Library             String
Library             BuiltIn
Library             SeleniumLibrary
Resource            ../../keywords/kolekto.robot
Resource            ./parties.pageObj.robot
Resource            ../contact.test/addContact.pageObj.robot

*** Keywords ***

#CLIENT

Add new contact
    Click Button  ${New_Contact_Button}
    Wait Until Element Is Visible  ${Party_Form}  timeout=3
    Kolekto Dropdown Select From List By Value  ${Party_Role}  Client

Complete Add Client (company) form
    Click Element  ${Party_Company_RadioButton}
    Click Element  ${Party_Beneficiary_Toggle}
    Wait Until Element Is Visible  ${Party_Beneficiary_Toggle_Checked}  timeout=2
    Input Text  ${Party_Company_Name}  Client Company Autotest@{randomStrList}[0]
    Input Text  ${Party_KVK}  @{randomStrList}[0]
    Kolekto Dropdown Select From List By Value  ${Party_Legal_Form}  Foundation
    Input Text  ${Party_PostalCode}  1111ab
    Input Text  ${Party_Number}  11
    Input Text  ${Party_Addition}  D
    Wait Until Element Is Visible  ${Party_Street}  timeout=5
    Wait Until Element Is Visible  ${Party_City}  timeout=5
    Input Text  ${Party_PhoneNumber}  +84932733681
    Input Text  ${Party_MobileNumber}  +84948018747
    Input Text  ${Party_EmailAddress}  linh.mai@kolekto.nl
    Input Text  ${Party_AccountHolder}  Auto Test
    Input Text  ${Party_IBAN}  AT12345678900000
    
Submit Add Client (company) form
    Click Button  ${Party_Submit}

Check the Client Company item in the Parties List
    Wait Until Element Is Not Visible  ${Party_Form}  timeout=10
    Wait Until Element Contains  ${Parties_List}  Client Company Autotest@{randomStrList}[0]  timeout=10 

Complete Add Client (contact) form
    Click Element  ${Party_Contact_RadioButton}
    Input Text  ${Party_Initials}  CCAT
    Input Text  ${Party_Firstname}  Client
    Input Text  ${Party_Prefix}  Contact
    Input Text  ${Party_Lastname}  Autotest@{randomStrList}[0]
    Kolekto Date Picker  ${Party_DateofBirth}  15-12-1986
    Kolekto Dropdown Select From List By Value  ${Party_Gender}  Female
    Kolekto Dropdown Select From List By Value  ${Party_Legal_Form}  General partnership
    Input Text  ${Party_TradeName}  Test Trade name
    Click Element  ${Party_POBox}
    Wait Until Element Is Visible  ${Party_POBox_Checked}  timeout=2
    Input Text  ${Party_PostalCode}  1111ab
    Input Text  ${Party_Number}  11
    Input Text  ${Party_City_POBox}  Amsterdam
    Input Text  ${Party_PhoneNumber}  +84932733681
    Input Text  ${Party_MobileNumber}  +84948018747
    Input Text  ${Party_EmailAddress}  linh.mai@kolekto.nl

Submit Add Client (contact) form
    Click Button  ${Party_Submit}

Check the Client Contact item in the Parties List
    Wait Until Element Is Not Visible  ${Party_Form}  timeout=10
    Wait Until Element Contains  ${Parties_List}  Autotest@{randomStrList}[0], C.C.A.T. Contact  timeout=10

Select role and contact in Add party form for client 
    Kolekto Dropdown Select From List By Value  ${Party_Group}  Client
    Kolekto Filter Dropdown Select From List By Value  ${Party_Contact_List}  Linh Mai, L.M.C. Auto Client
    Wait Until Element Is Visible  ${Party_Group}  timeout=2
    Wait Until Element Is Visible  ${Party_Contact_List}  timeout=2
    Click Button  ${Party_Next}

Verify information after adding client to party form
    Wait Until Element Is Visible  ${Party_Form}  timeout=3
    Element Should Contain  ${Party_Role}  Client
    Element Attribute Value Should Be  ${Party_Initials}  value  L.M.C.
    Element Attribute Value Should Be  ${Party_Firstname}  value  Contact
    Element Attribute Value Should Be  ${Party_Prefix}  value  Auto Client
    Element Attribute Value Should Be  ${Party_Lastname}  value  Linh Mai
    Element Should Contain  ${Party_Legal_Form}  Sole proprietor
    Element Attribute Value Should Be  ${Party_TradeName}  value  Tradename autoTest
    Element Attribute Value Should Be  ${Party_PostalCode}  value  3011 NA
    Element Attribute Value Should Be  ${Party_Number}  value  20
    Element Attribute Value Should Be  ${Party_Addition}  value  A
    Element Attribute Value Should Be  ${Party_Street_Compare}  value  Mariniershof
    Element Attribute Value Should Be  ${Party_City_Compare}  value  Rotterdam
    Element Attribute Value Should Be  ${Party_PhoneNumber}  value  +840123456789
    Element Attribute Value Should Be  ${Party_MobileNumber}  value  +840987654321
    Element Attribute Value Should Be  ${Party_EmailAddress}  value  linh.mai@kolekto.nl

Add date of birth and gender for client
    Kolekto Date Picker  ${Party_DateofBirth}  15-12-1986
    Kolekto Dropdown Select From List By Value  ${Party_Gender}  Female

Open client company (added from party form) item again
    Click Element From Parties List  ${Parties_List}  Client Company Autotest@{randomStrList}[0]
    Wait Until Element Is Visible  ${Party_Detais_Form}  timeout=3

Open client company (added from contact list) item again
    Click Element From Parties List  ${Parties_List}  Client Auto Test Company from Contact
    Wait Until Element Is Visible  ${Party_Detais_Form}  timeout=3

Update information for client company
    Kolekto Clear Element Text   ${Party_Company_Name}
    Input Text  ${Party_Company_Name}  Client Company Autotest_edited@{randomStrList}[0]
    Kolekto Clear Element Text   ${Party_PostalCode}
    Input Text  ${Party_PostalCode}  1111ab
    Kolekto Clear Element Text   ${Party_Number}
    Input Text  ${Party_Number}  11
    Kolekto Clear Element Text   ${Party_Addition}
    Wait Until Element Is Visible  ${Party_Street}  timeout=5
    Wait Until Element Is Visible  ${Party_City}  timeout=5
    Input Text  ${Party_Addition}  E
    Kolekto Clear Element Text   ${Party_PhoneNumber}
    Input Text  ${Party_PhoneNumber}  +84932733681111
    Kolekto Clear Element Text   ${Party_MobileNumber}
    Input Text  ${Party_MobileNumber}  +84948018747222
    Kolekto Clear Element Text   ${Party_EmailAddress}
    Input Text  ${Party_EmailAddress}  linh.mai+edited@kolekto.nl

Switch on the toggle 'Save changes to contact list' in client company
    Click Element  ${Party_SaveChanges_Toggle}

Submit for updating company
    Click Button  ${Party_Submit}

Check the Client Company item in the Parties List after updating
    Wait Until Element Is Not Visible  ${Party_Form}  timeout=10
    Wait Until Element Contains  ${Parties_List}  Client Company Autotest_edited@{randomStrList}[0]  timeout=10

Open Contact page and verify changes in client company
    Go To Contacts
    Wait Until Element Is Visible  ${ContactList}  timeout=5
    Input Text  ${Contact_Search_Box}  Client Company Autotest_edited@{randomStrList}[0]
    Click Element From Contacts List  ${ContactList}  Client Company Autotest_edited@{randomStrList}[0]
    Wait Until Element Is Visible  ${AddContactForm}  timeout=5
    Element Attribute Value Should Be  ${CompanyName}  value  Client Company Autotest_edited@{randomStrList}[0]
    Element Attribute Value Should Be  ${PostalCodeField}  value  1111 AB
    Element Attribute Value Should Be  ${NumberField}  value  11
    Element Attribute Value Should Be  ${PhoneNumberField}  value  +84932733681111
    Element Attribute Value Should Be  ${MobilePhoneField}  value  +84948018747222
    Element Attribute Value Should Be  ${EmailAddressField}  value  linh.mai+edited@kolekto.nl

Select role and company in Add party form (client)
    Kolekto Dropdown Select From List By Value  ${Party_Group}  Client
    Kolekto Filter Dropdown With Scroll Select From List By Value  ${Party_Contact_List}  Client Auto Test Company from Contact   
    Wait Until Element Is Visible  ${Party_Group}  timeout=2
    Wait Until Element Is Visible  ${Party_Contact_List}  timeout=2
    Click Button  ${Party_Next}

Delete client company item
    Click Button  ${Party_Delete}
    Wait Until Element Is Visible  ${Party_Confirm}  timeout=3
    Click Button  ${Party_Confirm}

Verify client company item in parties list after deleting
    Wait Until Element Is Not Visible  ${Party_Form}  timeout=10
    Wait Until Element Does Not Contain  ${Parties_List}  Client Auto Test Company from Contact  timeout=10

Verify company information after adding to party form
    Wait Until Element Is Visible  ${Party_Form}  timeout=3
    Element Should Contain  ${Party_Role}  Client
    Element Attribute Value Should Be  ${Party_Company_Name}  value  Client Auto Test Company from Contact
    Element Should Contain  ${Party_Legal_Form}  Public limited company
    Element Attribute Value Should Be  ${Party_PostalCode}  value  3011 NA
    Element Attribute Value Should Be  ${Party_Number}  value  20
    Element Attribute Value Should Be  ${Party_Street_Compare}  value  Mariniershof
    Element Attribute Value Should Be  ${Party_City_Compare}  value  Rotterdam
    Element Attribute Value Should Be  ${Party_PhoneNumber}  value  +84932711681
    Element Attribute Value Should Be  ${Party_MobileNumber}  value  +84948018747
    Element Attribute Value Should Be  ${Party_EmailAddress}  value  linh.mai@kolekto.nl

Check the Client Contact (added from contact list) item in the Parties List
    Wait Until Element Is Not Visible  ${Party_Form}  timeout=10
    Wait Until Element Contains  ${Parties_List}  Linh Mai, L.M.C. Auto Client  timeout=10

Check the Client Company (added from contact list) item in the Parties List
    Wait Until Element Is Not Visible  ${Party_Form}  timeout=10
    Wait Until Element Contains  ${Parties_List}  Client Auto Test Company from Contact  timeout=10

Select role and check contact list
    Kolekto Dropdown Select From List By Value  ${Party_Group}  Client
    Click Element  ${Party_Contact_List}
    Scroll Element Into View  ${Party_Contact_ListOptions}
    Wait Until Element Is Not Visible  ${Party_Company_RadioButton}  timeout=3
    
Click on title of form to lose forcus 
    Click Element  ${Party_Header_AddPartyForm}

Open party form and check Company icon 
    Wait Until Element Is Visible  ${New_Contact_Button}  timeout=3
    Click Button  ${New_Contact_Button}
    Wait Until Element Is Visible  ${Party_Form}  timeout=3
    Element Should Be Disabled  ${Party_Company_WholeRadioButton}

Close form
    Click Button  ${Party_Cancel_Button}
    Wait Until Element Is Not Visible  ${Party_Form}  timeout=10
    Wait Until Element Is Visible  ${Parties_List}  timeout=3

