*** Settings ***
Documentation   Test create new dossier
Library         SeleniumLibrary
Library         DateTime
Library         BuiltIn
Resource        ../../keywords/kolekto.robot
Resource        ../../variables/variables.robot
Resource        ./createDossier.resource.robot

Suite Setup      Setup New Dossier Test Suite                                            
Suite Teardown   Close Browser

*** Test Cases ***

Create new dossier with default values
    Given Dossier list Opened
    When Open new dossier form
    Then New dossier form is opened
    And Dossier reference is filled automatically
    Complete General information part
    Complete Property part
    Complete Claim part
    Complete Retal agreement part
    Wait Duplicated Address block show
    Save new dossier form
    It opens dossier overview

Create new dossier with optional values
    Given Dossier list Opened
    When Open new dossier form
    Then New dossier form is opened
    And Dossier reference is filled automatically
    Complete General information part
    Complete Ownership part
    Complete Property part
    Complete Claim part with optional fields
    Complete Retal agreement part
    Save new dossier form
    It opens dossier overview

Check the negatives cases 
    When Open new dossier form
    Complete General information part
    Wrong address
    Input letters to Claim amount field 
    Input letters to Rental agreement amount field 
    Wrong format for Date in Claim part 
    Wrong format for Date in Rental agreement part


    