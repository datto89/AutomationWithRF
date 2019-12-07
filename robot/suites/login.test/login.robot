*** Settings ***
Documentation   Test to verfiy login to Kolekto Huur web app with success and fail depend on
...             the user accounts is O365 was register in kolekto app
...             and rule user was setup correctly in organization

Library         SeleniumLibrary
Resource        ../../Variables/variables.robot
Resource        ../../keywords/kolekto.robot
Test Teardown   Close Browser

*** Test Cases ***
Login success as service provider
    Log     Login with username=${ValidUser}, pass=${KolektoPassword}
    Login Kolekto App  username=${ValidUser}  pass=${KolektoPassword}
    Kolekto Dashboard Should Be Opened

Login as inactive user
    Log     Login with username=${InactiveUser}, pass=${KolektoPassword}
    Login Kolekto App  username=${InactiveUser}  pass=${KolektoPassword}
    Page Should Contain  ${AccessDenied}
