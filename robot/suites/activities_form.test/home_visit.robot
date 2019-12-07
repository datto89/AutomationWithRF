*** Settings ***
Documentation   Test add/update home visit
Library         SeleniumLibrary
Resource        ../../keywords/kolekto.robot
Resource        ../../variables/variables.robot
Resource        ./activities.resource.robot


Suite Setup      Setup Activities Test Suite                            
Suite Teardown   Close Browser

*** Test Cases ***
Add Home visit
    Open Home visit form
    Specify date and time for Home visit
    Add Description
    Select Status 
    Submit for Home visit form
    Verify Home visit item in Activities list 
    
Update Home visit
    Open Home visit form again
    Choose another date and time 
    Change Description
    Select another Status 
    Submit for Home visit form
    Verify Home visit item in Activities list after updating 