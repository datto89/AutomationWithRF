*** Settings ***
Documentation   Test add/update letter template
Library         SeleniumLibrary
Resource        ../../../keywords/kolekto.robot
Resource        ../../../variables/variables.robot
Resource        ./templates.resource.robot


Suite Setup      Setup Templates Test Suite                                           
Suite Teardown   Close Browser

*** Test Cases ***
Add letter template
    Go To System Templates
    Add letter template
    Check letter template after adding

Edit letter template
    Open edit letter template form
    Change letter template information
    Check letter template after editing

Delete letter template
    From letter templates list, delete SMS template
    Check letter template after deleting