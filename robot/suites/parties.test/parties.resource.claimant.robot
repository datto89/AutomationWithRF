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

Select role and company in Add party form for claimant
    Kolekto Dropdown Select From List By Value  ${Party_Group}  Claimant
    Kolekto Filter Dropdown Select From List By Value  ${Party_Contact_List}  Claimant Auto Test Company from Contact
    Wait Until Element Is Visible  ${Party_Group}  timeout=2
    Wait Until Element Is Visible  ${Party_Contact_List}  timeout=2
    Click Button  ${Party_Next}

Verify company information after adding claimant to party form
    Wait Until Element Is Visible  ${Party_Form}  timeout=3
    Element Should Contain  ${Party_Role}  Claimant
    Element Attribute Value Should Be  ${Party_Company_Name}  value  Claimant Auto Test Company from Contact
    Element Should Contain  ${Party_Legal_Form}  Cooperative
    Element Attribute Value Should Be  ${Party_PostalCode}  value  1188 JB
    Element Attribute Value Should Be  ${Party_Number}  value  44
    Element Attribute Value Should Be  ${Party_Street_Compare}  value  De Nessermolen
    Element Attribute Value Should Be  ${Party_City_Compare}  value  Amstelveen
    Element Attribute Value Should Be  ${Party_PhoneNumber}  value  +840123456789
    Element Attribute Value Should Be  ${Party_MobileNumber}  value  +840987654321
    Element Attribute Value Should Be  ${Party_EmailAddress}  value  linh.mai@kolekto.nl

Check the Claimant Company (added from contact list) item in the Parties List
    Wait Until Element Is Not Visible  ${Party_Form}  timeout=10
    Wait Until Element Contains  ${Parties_List}  Claimant Auto Test Company from Contact  timeout=10

Select role and contact in Add party form for claimant
    Kolekto Dropdown Select From List By Value  ${Party_Group}  Claimant
    Kolekto Filter Dropdown Select From List By Value  ${Party_Contact_List}  Linh Mai, L.M.C. Auto Claimant
    Wait Until Element Is Visible  ${Party_Group}  timeout=2
    Wait Until Element Is Visible  ${Party_Contact_List}  timeout=2
    Click Button  ${Party_Next}

Verify information after adding claimant to party form
    Wait Until Element Is Visible  ${Party_Form}  timeout=3
    Element Should Contain  ${Party_Role}  Claimant
    Element Attribute Value Should Be  ${Party_Initials}  value  L.M.C.
    Element Attribute Value Should Be  ${Party_Firstname}  value  Contact
    Element Attribute Value Should Be  ${Party_Prefix}  value  Auto Claimant
    Element Attribute Value Should Be  ${Party_Lastname}  value  Linh Mai
    Element Should Contain  ${Party_Legal_Form}  Limited partnership
    Element Attribute Value Should Be  ${Party_TradeName}  value  Claimant 123
    Element Attribute Value Should Be  ${Party_PostalCode}  value  3011 NA
    Element Attribute Value Should Be  ${Party_Number}  value  20
    Element Attribute Value Should Be  ${Party_Addition}  value  A
    Element Attribute Value Should Be  ${Party_Street_Compare}  value  Mariniershof
    Element Attribute Value Should Be  ${Party_City_Compare}  value  Rotterdam
    Element Attribute Value Should Be  ${Party_PhoneNumber}  value  +840123456789
    Element Attribute Value Should Be  ${Party_MobileNumber}  value  +840987654321
    Element Attribute Value Should Be  ${Party_EmailAddress}  value  linh.mai@kolekto.nl

Add date of birth and gender for claimant
    Kolekto Date Picker  ${Party_DateofBirth}  15-10-1986
    Kolekto Dropdown Select From List By Value  ${Party_Gender}  Male

Check the Claimant Contact (added from contact list) item in the Parties List
    Wait Until Element Is Not Visible  ${Party_Form}  timeout=10
    Wait Until Element Contains  ${Parties_List}  Linh Mai, L.M.C. Auto Claimant  timeout=10

Add new claimant
    Click Button  ${New_Contact_Button}
    Wait Until Element Is Visible  ${Party_Form}  timeout=3
    Kolekto Dropdown Select From List By Value  ${Party_Role}  Claimant

Complete Add claimant (company) form
    Click Element  ${Party_Company_RadioButton}
    Click Element  ${Party_Beneficiary_Toggle}
    Wait Until Element Is Visible  ${Party_Beneficiary_Toggle_Checked}  timeout=2
    Input Text  ${Party_Company_Name}  Claimant Company Autotest@{randomStrList}[0]
    Input Text  ${Party_KVK}  @{randomStrList}[0]
    Kolekto Dropdown Select From List By Value  ${Party_Legal_Form}  Cooperative
    Input Text  ${Party_PostalCode}  3011na
    Input Text  ${Party_Number}  20
    Input Text  ${Party_Addition}  D
    Wait Until Element Is Visible  ${Party_Street}  timeout=5
    Wait Until Element Is Visible  ${Party_City}  timeout=5
    Input Text  ${Party_PhoneNumber}  +84932733681
    Input Text  ${Party_MobileNumber}  +84948018747
    Input Text  ${Party_EmailAddress}  linh.mai@kolekto.nl
    Input Text  ${Party_AccountHolder}  Auto Test
    Input Text  ${Party_IBAN}  AT009876543211111

Submit Add claimant (company) form
    Click Button  ${Party_Submit}

Check the Claimant Company (added from party form) item in the Parties List
    Wait Until Element Is Not Visible  ${Party_Form}  timeout=10
    Wait Until Element Contains  ${Parties_List}  Claimant Company Autotest@{randomStrList}[0]  timeout=10

Complete Add claimant (contact) form
    Click Element  ${Party_Contact_RadioButton}
    Input Text  ${Party_Initials}  CCAT
    Input Text  ${Party_Firstname}  Contact
    Input Text  ${Party_Prefix}  Claimant
    Input Text  ${Party_Lastname}  Autotest@{randomStrList}[0]
    Kolekto Date Picker  ${Party_DateofBirth}  01-01-1990
    Kolekto Dropdown Select From List By Value  ${Party_Gender}  Unknown
    Kolekto Dropdown Select From List By Value  ${Party_Legal_Form}  Professional partnership
    Input Text  ${Party_TradeName}  Test Trade name for Claimant
    Click Element  ${Party_POBox}
    Wait Until Element Is Visible  ${Party_POBox_Checked}  timeout=2
    Input Text  ${Party_PostalCode}  2909lg
    Input Text  ${Party_Number}  11
    Input Text  ${Party_City_POBox}  Amsterdam
    Input Text  ${Party_PhoneNumber}  +84932733681
    Input Text  ${Party_MobileNumber}  +84948018747
    Input Text  ${Party_EmailAddress}  linh.mai@kolekto.nl

Submit Add claimant (contact) form
    Click Button  ${Party_Submit}

Check the Claimant Contact (added from party form) item in the Parties List
    Wait Until Element Is Not Visible  ${Party_Form}  timeout=10
    Wait Until Element Contains  ${Parties_List}  Autotest@{randomStrList}[0], C.C.A.T. Claimant  timeout=10

Open claimant contact (added from contact list) item again
    Click Element From Parties List  ${Parties_List}  Linh Mai, L.M.C. Auto Claimant
    Wait Until Element Is Visible  ${Party_Detais_Form}  timeout=3

Delete claimant contact item    
    Click Button  ${Party_Delete}
    Wait Until Element Is Visible  ${Party_Confirm}  timeout=3
    Click Button  ${Party_Confirm}

Verify claimant contact item in parties list after deleting
    Wait Until Element Is Not Visible  ${Party_Form}  timeout=10
    Wait Until Element Does Not Contain  ${Parties_List}  Linh Mai, L.M.C. Auto Claimant  timeout=10

Open claimant company (added from party form) item again
    Click Element From Parties List  ${Parties_List}  Claimant Company Autotest@{randomStrList}[0]
    Wait Until Element Is Visible  ${Party_Detais_Form}  timeout=3

Update information for claimant company
    Kolekto Clear Element Text   ${Party_Company_Name}
    Input Text  ${Party_Company_Name}  Claimant Company Autotest_edited@{randomStrList}[0]
    Kolekto Clear Element Text   ${Party_PostalCode}
    Input Text  ${Party_PostalCode}  1111ab
    Kolekto Clear Element Text   ${Party_Number}
    Input Text  ${Party_Number}  11
    Kolekto Clear Element Text   ${Party_Addition}
    Wait Until Element Is Visible  ${Party_Street}  timeout=5
    Wait Until Element Is Visible  ${Party_City}  timeout=5
    Input Text  ${Party_Addition}  E
    Kolekto Clear Element Text   ${Party_PhoneNumber}
    Input Text  ${Party_PhoneNumber}  +84932733680000
    Kolekto Clear Element Text   ${Party_MobileNumber}
    Input Text  ${Party_MobileNumber}  +849480187470000
    Kolekto Clear Element Text   ${Party_EmailAddress}
    Input Text  ${Party_EmailAddress}  linh.mai+edited@kolekto.nl

Switch on the toggle 'Save changes to contact list' in claimant company
    Click Element  ${Party_SaveChanges_Toggle}

Submit for updating company
    Click Button  ${Party_Submit}

Check the Claimant Company item in the Parties List after updating
    Wait Until Element Is Not Visible  ${Party_Form}  timeout=10
    Wait Until Element Contains  ${Parties_List}  Claimant Company Autotest_edited@{randomStrList}[0]  timeout=10

Open Contact page and verify changes in claimant company
    Go To Contacts
    Wait Until Element Is Visible  ${ContactList}  timeout=5
    Input Text  ${Contact_Search_Box}  Claimant Company Autotest_edited@{randomStrList}[0]
    Click Element From Contacts List  ${ContactList}  Claimant Company Autotest_edited@{randomStrList}[0]
    Wait Until Element Is Visible  ${AddContactForm}  timeout=5
    Element Attribute Value Should Be  ${CompanyName}  value  Claimant Company Autotest_edited@{randomStrList}[0]
    Element Attribute Value Should Be  ${PostalCodeField}  value  1111 AB
    Element Attribute Value Should Be  ${NumberField}  value  11
    Element Attribute Value Should Be  ${Address_Street}  value  Diemerkade
    Element Attribute Value Should Be  ${Address_City}  value  Diemen
    Element Attribute Value Should Be  ${PhoneNumberField}  value  +84932733680000
    Element Attribute Value Should Be  ${MobilePhoneField}  value  +849480187470000
    Element Attribute Value Should Be  ${EmailAddressField}  value  linh.mai+edited@kolekto.nl
    