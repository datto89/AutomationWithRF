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

Select role and company in Add party form for debtor
    Kolekto Dropdown Select From List By Value  ${Party_Group}  Debtor
    Kolekto Filter Dropdown Select From List By Value  ${Party_Contact_List}  Debtor Auto Test Company from Contact
    Wait Until Element Is Visible  ${Party_Group}  timeout=2
    Wait Until Element Is Visible  ${Party_Contact_List}  timeout=2
    Click Button  ${Party_Next}

Verify company information after adding debtor to party form
    Wait Until Element Is Visible  ${Party_Form}  timeout=3
    Element Should Contain  ${Party_Role}  Debtor
    Element Attribute Value Should Be  ${Party_Company_Name}  value  Debtor Auto Test Company from Contact
    Element Should Contain  ${Party_Legal_Form}  Company under foreign law
    Element Attribute Value Should Be  ${Party_PostalCode}  value  3035 SE
    Element Attribute Value Should Be  ${Party_Number}  value  61
    Element Attribute Value Should Be  ${Party_Street_Compare}  value  Gerard Scholtenstraat
    Element Attribute Value Should Be  ${Party_City_Compare}  value  Rotterdam
    Element Attribute Value Should Be  ${Party_PhoneNumber}  value  +840123456789
    Element Attribute Value Should Be  ${Party_MobileNumber}  value  +840987654321
    Element Attribute Value Should Be  ${Party_EmailAddress}  value  linh.mai@kolekto.nl

Check the Debtor Company (added from contact list) item in the Parties List
    Wait Until Element Is Not Visible  ${Party_Form}  timeout=10
    Wait Until Element Contains  ${Parties_List}  Debtor Auto Test Company from Contact  timeout=10

Select role and contact in Add party form for debtor
    Kolekto Dropdown Select From List By Value  ${Party_Group}  Debtor
    Kolekto Filter Dropdown Select From List By Value  ${Party_Contact_List}  Linh Mai, L.M.D. Auto Debtor
    Wait Until Element Is Visible  ${Party_Group}  timeout=2
    Wait Until Element Is Visible  ${Party_Contact_List}  timeout=2
    Click Button  ${Party_Next}

Verify information after adding debtor to party form
    Wait Until Element Is Visible  ${Party_Form}  timeout=3
    Element Should Contain  ${Party_Role}  Debtor
    Element Attribute Value Should Be  ${Party_Initials}  value  L.M.D.
    Element Attribute Value Should Be  ${Party_Firstname}  value  Contact
    Element Attribute Value Should Be  ${Party_Prefix}  value  Auto Debtor
    Element Attribute Value Should Be  ${Party_Lastname}  value  Linh Mai
    Element Should Contain  ${Party_Legal_Form}  Sole proprietor
    Element Attribute Value Should Be  ${Party_TradeName}  value  Debtor auto 123
    Element Attribute Value Should Be  ${Party_PostalCode}  value  2324 AB
    Element Attribute Value Should Be  ${Party_Number}  value  10
    Element Attribute Value Should Be  ${Party_Addition}  value  M
    Element Attribute Value Should Be  ${Party_Street_Compare}  value  Voorschoterweg
    Element Attribute Value Should Be  ${Party_City_Compare}  value  Leiden
    Element Attribute Value Should Be  ${Party_PhoneNumber}  value  +841234567890
    Element Attribute Value Should Be  ${Party_MobileNumber}  value  +840987654321
    Element Attribute Value Should Be  ${Party_EmailAddress}  value  linh.mai+debtor@kolekto.nl
    Input Text  ${Party_External_Ref}  Debtor111
    Click Element  ${Party_Insolvent_Toggle}
    Wait Until Element Is Visible  ${Party_Insolvent_Toggle_Checked}  timeout=2
    Kolekto Date Picker  ${Party_Insolvent_Date}  12-11-2018
    Click Element  ${Party_Deceased_Toggle}
    Wait Until Element Is Visible  ${Party_Deceased_Toggle_Checked}  timeout=2
    Kolekto Date Picker  ${Party_Deceased_Date}  12-11-2018
    Input Text  ${Party_Insolvency_Note}  Test Debtor insolvent/deceased

Add date of birth and gender for debtor
    Kolekto Date Picker  ${Party_DateofBirth}  15-11-1980
    Kolekto Dropdown Select From List By Value  ${Party_Gender}  Unknown

Check the Debtor Contact (added from contact list) item in the Parties List
    Wait Until Element Is Not Visible  ${Party_Form}  timeout=10
    Wait Until Element Contains  ${Parties_List}  Linh Mai, L.M.D. Auto Debtor  timeout=10

Verify that the debtor is Insolvent and Deceased
    Wait Until Element Contains  ${Party_Insolvent_Warning}  Tenant Contact Auto Debtor Linh Mai is insolvent  timeout=3
    Wait Until Element Contains  ${Party_Insolvent_Warning}  Tenant Contact Auto Debtor Linh Mai is deceased  timeout=3

Add new debtor
    Click Button  ${New_Contact_Button}
    Wait Until Element Is Visible  ${Party_Form}  timeout=3
    Kolekto Dropdown Select From List By Value  ${Party_Role}  Debtor

Complete Add debtor (company) form
    Click Element  ${Party_Company_RadioButton}
    Input Text  ${Party_Company_Name}  Debtor Company Autotest@{randomStrList}[0]
    Input Text  ${Party_KVK}  @{randomStrList}[0]
    Kolekto Dropdown Select From List By Value  ${Party_Legal_Form}  Cooperative
    Input Text  ${Party_PostalCode}  1111ab
    Input Text  ${Party_Number}  11
    Input Text  ${Party_Addition}  D
    Wait Until Element Is Visible  ${Party_Street}  timeout=5
    Wait Until Element Is Visible  ${Party_City}  timeout=5
    Input Text  ${Party_PhoneNumber}  +84932733681
    Input Text  ${Party_MobileNumber}  +84948018747
    Input Text  ${Party_EmailAddress}  linh.mai+debtor2@kolekto.nl
    Input Text  ${Party_External_Ref}  Debtor222

Submit Add debtor (company) form
    Click Button  ${Party_Submit}

Check the Debtor Company (added from party form) item in the Parties List
    Wait Until Element Is Not Visible  ${Party_Form}  timeout=10
    Wait Until Element Contains  ${Parties_List}  Debtor Company Autotest@{randomStrList}[0]  timeout=10

Complete Add debtor (contact) form
    Click Element  ${Party_Contact_RadioButton}
    Input Text  ${Party_Initials}  DCAT
    Input Text  ${Party_Firstname}  Contact
    Input Text  ${Party_Prefix}  Debtor
    Input Text  ${Party_Lastname}  Autotest@{randomStrList}[0]
    Kolekto Date Picker  ${Party_DateofBirth}  01-12-1992
    Kolekto Dropdown Select From List By Value  ${Party_Gender}  Male
    Kolekto Dropdown Select From List By Value  ${Party_Legal_Form}  General partnership
    Input Text  ${Party_TradeName}  Test Trade name for Debtor
    Click Element  ${Party_POBox}
    Wait Until Element Is Visible  ${Party_POBox_Checked}  timeout=2
    Input Text  ${Party_PostalCode}  2909lg
    Input Text  ${Party_Number}  11
    Input Text  ${Party_City_POBox}  Amsterdam
    Input Text  ${Party_PhoneNumber}  +840123456789
    Input Text  ${Party_MobileNumber}  +840987654321
    Input Text  ${Party_EmailAddress}  linh.mai+debtor3@kolekto.nl
    
Submit Add debtor (contact) form
    Click Button  ${Party_Submit}

Check the Debtor Contact (added from party form) item in the Parties List
    Wait Until Element Is Not Visible  ${Party_Form}  timeout=10
    Wait Until Element Contains  ${Parties_List}  Autotest@{randomStrList}[0], D.C.A.T. Debtor  timeout=10

Open debtor contact (added from contact list) item again
    Click Element From Parties List  ${Parties_List}  Linh Mai, L.M.D. Auto Debtor
    Wait Until Element Is Visible  ${Party_Detais_Form}  timeout=3

Delete debtor contact item
    Click Button  ${Party_Delete}
    Wait Until Element Is Visible  ${Party_Confirm}  timeout=3
    Click Button  ${Party_Confirm}

Verify debtor contact item in parties list after deleting
    Wait Until Element Is Not Visible  ${Party_Form}  timeout=10
    Wait Until Element Does Not Contain  ${Parties_List}  Linh Mai, L.M.D. Auto Debtor  timeout=10

Open debtor company (added from party form) item again
    Click Element From Parties List  ${Parties_List}  Debtor Company Autotest@{randomStrList}[0]
    Wait Until Element Is Visible  ${Party_Detais_Form}  timeout=3

Update information for debtor company
    Kolekto Clear Element Text   ${Party_Company_Name}
    Input Text  ${Party_Company_Name}  Debtor Company Autotest_edited@{randomStrList}[0]
    Kolekto Clear Element Text   ${Party_PostalCode}
    Input Text  ${Party_PostalCode}  2909lg
    Kolekto Clear Element Text   ${Party_Number}
    Input Text  ${Party_Number}  11
    Kolekto Clear Element Text   ${Party_Addition}
    Wait Until Element Is Visible  ${Party_Street}  timeout=5
    Wait Until Element Is Visible  ${Party_City}  timeout=5
    Input Text  ${Party_Addition}  M
    Kolekto Clear Element Text   ${Party_PhoneNumber}
    Input Text  ${Party_PhoneNumber}  +84932733681111
    Kolekto Clear Element Text   ${Party_MobileNumber}
    Input Text  ${Party_MobileNumber}  +84948018747777
    Kolekto Clear Element Text   ${Party_EmailAddress}
    Input Text  ${Party_EmailAddress}  linh.mai+edited@kolekto.nl

Switch on the toggle 'Save changes to contact list' in debtor company
    Click Element  ${Party_SaveChanges_Toggle}

Submit for updating company
    Click Button  ${Party_Submit}

Check the Debtor Company item in the Parties List after updating
    Wait Until Element Is Not Visible  ${Party_Form}  timeout=10
    Wait Until Element Contains  ${Parties_List}  Debtor Company Autotest_edited@{randomStrList}[0]  timeout=10

Open Contact page and verify changes in debtor company
    Go To Contacts
    Wait Until Element Is Visible  ${ContactList}  timeout=5
    Input Text  ${Contact_Search_Box}  Debtor Company Autotest_edited@{randomStrList}[0]
    Click Element From Contacts List  ${ContactList}  Debtor Company Autotest_edited@{randomStrList}[0]
    Wait Until Element Is Visible  ${AddContactForm}  timeout=5
    Element Attribute Value Should Be  ${CompanyName}  value  Debtor Company Autotest_edited@{randomStrList}[0]
    Element Attribute Value Should Be  ${PostalCodeField}  value  2909 LG
    Element Attribute Value Should Be  ${NumberField}  value  11
    Element Attribute Value Should Be  ${Address_Street}  value  Rivium 2e straat
    Element Attribute Value Should Be  ${Address_City}  value  Capelle aan den IJssel
    Element Attribute Value Should Be  ${PhoneNumberField}  value  +84932733681111
    Element Attribute Value Should Be  ${MobilePhoneField}  value  +84948018747777
    Element Attribute Value Should Be  ${EmailAddressField}  value  linh.mai+edited@kolekto.nl