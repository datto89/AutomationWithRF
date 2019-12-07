*** Settings ***
Documentation   Test add/update SMS template
Library         SeleniumLibrary
Resource        ../../../keywords/kolekto.robot
Resource        ../../../variables/variables.robot
Resource        ./templates.resource.robot


Suite Setup      Setup Templates Test Suite                                           
Suite Teardown   Close Browser

*** Test Cases ***
Add SMS template
    Go To System Templates
    Add SMS template
    Check SMS template after adding

Edit SMS template
    Open edit SMS template form
    Change SMS template information
    Check SMS template after editing

Delete SMS template
    From SMS templates list, delete SMS template
    Check SMS template after deleting