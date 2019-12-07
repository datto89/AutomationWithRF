*** Settings ***
Documentation   Elements of create dossier page

*** Variables ***
${NewDossierButton}         xpath://div[@class='dynamic-command-bar']/div/div/div/div/div/button
${NewDossierForm}           css:.newDossierContainer
${Newdossier_DossierReference}  css:.kolekto-dossier-ref
${ExternalReference}        css:.kolekto-external-reference input
${DossierOwner}             css:.kolekto-organization
${DossierType}              css:.kolekto-dossier-type
${ProcessStage}             css:.kolekto-process-flow
${PropertyName}             css:.kolekto-property-name input
${Newdossier_PostalCode}    css:.post-code
${Newdossier_PostalCode_Input}    css:.post-code input
${Newdosssier_Number}       css:.number
${Newdosssier_Number_Input}       css:.number input
${Newdossier_AdditionNumber}    css:.additional-number input
${Newdossier_AddressField}      css:.street 
${Newdossier_CityField}         css:.city
${Newdosssier_PropertyReference}    css:.kolekto-property-reference input
${Newdossier_BookingCategory}       xpath://div[@class='kolekto-combobox kolekto-category']//i[@data-icon-name='ChevronDown']
${Newdossier_Amount}        css:.kolekto-amount
${Newdossier_Amount_Input}        css:.kolekto-amount input
${Newdossier_BookingDate}    css:.kolekto-booking-date
${Newdossier_BookingDate_Input}    css:.kolekto-booking-date input
${Newdossier_CalculatedUntil}     css:.kolekto-calc-until input
${Newdossier_Description}   css:.kolekto-description textarea
${Newdossier_RentalReference}   css:.kolekto-reference input
${Newdossier_RentalAmount}      css:.kolekto-rental-agreement .kolekto-amount
${Newdossier_RentalAmount_Input}      css:.kolekto-rental-agreement .kolekto-amount input
${Newdossier_Frequency}  css:.kolekto-frequency
${Newdossier_DatePicker_RentalStartDate}    css:.kolekto-period-from
${Newdossier_DatePicker_RentalEndDate}  css:.kolekto-period-to
${Newdossier_DatePicker_RentalStartDate_Input}    css:.kolekto-period-from input
${Newdossier_DatePicker_RentalEndDate_Input}  css:.kolekto-period-to input
${Newdossier_SaveButton}    css:.kolekto-submit
${DossierOverview}          css:.dossierContentContainer
${Newdossier_BeneficiaryCheckbox}  css:.kolekto-is-beneficiary
${Newdossier_Handler}   xpath://div[@class='kolekto-combobox kolekto-handler']//i[@data-icon-name='ChevronDown']
${Newdossier_HandlingOrg}   css:.kolekto-handling-organization
${NewDossier_DuplicatedAddress}  xpath://div[@class='duplicate-addresses-holder']
${Newdossier_AddClient_Checkbox}  css:.is-checked.kolekto-add-claimant
