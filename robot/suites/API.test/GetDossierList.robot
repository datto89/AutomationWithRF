*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     OperatingSystem
Library     JSONLibrary
Resource    ../../variables/variables.robot
Resource    ./GetDossierList.resource.robot

Suite Setup      Setup Activities Test Suite                            
Suite Teardown   Close Browser
*** Variables ***
#${CookieValue}  .AspNetCore.Cookies=CfDJ8J0hKIQmOfFIg7SmchE0APiioAHOVRzy-1LOieYDqfDBq5h2OIVi4MtV2Re6AYYb-9njXt1c13ZomZvFBXIrYkjqjPXvQoaFnDW7ohlfDKnP28fYKhzWfQC_suapLY1JXBaYwqgebgmVXBTAMF7kwLlkca_5TlR3m4zC_QK-eRTvWI85fmp-LoLkqq4LzqU3pHTEIQ5pvwoNsi82y8zX5UIdOd0M1dEcqLjk8FNoP93pwAp-EUgEKjT-bymYV63RjvI3FY_CBk8EMv2HW1hV2ZtSvllavNaV02-o3bdjvp9zynyQNUwsPbNrtTiSO7QAKQkEO0p6xIa2aPB3YCoRFQIfwVt9vpNDXbkVA9_H6CpIoWISNLsGtDccp9X5bMb0PwjlT8nQBznR_i8mfaASGx7ex6tzhucX-HoGcVdmfQeUuy_1c07v6fTUyXsiMVVB6tcIHltHspfjhZn7sp7jRc2zLpGNxOehohsfnEu73touGy4Stw3VUTJLBKfixfSMeNG6i25XF6DekHU3N7xmIPZftzA5tA444dV3C_it_JZfzFrbL6U9CNwq8Rvysb-4ZG-Ix0savhj0kG2nJfUbbuJcMHbx9gXygu9jMMisScqLZWEvPCshqVX07pSG0scXgzOj5u0N9tdhYaavVLFuz4Y3Y1Gqf2CIPbfK8qlbfgdhC7379uviYYCADaS7h-5etgvNK2gPRbbU9jOCnEjHF_8PZVrst2KncOLjv70kh5aX--F0oWkv6jnDK2I5Ajm03uWyJM8DiHtQita0w2Tk3igVonHWFNkiJ8mdFG5obBqnkWs3st_SLNo_2Y7q8XtyOONwwCcyIHq71yLm8JLcX7Kh2AqOGKAz0wAm6eJh54GDnuSn8_SIpWUzxhwpFkcy9ucqgRa_GDV2jNp2LW8sW-LRmQCx60SFPQELY6e2IOQ31DYBsaTYgP5XiBD713hSag3GUmogZG6JHgoWC1dh2ub4B1A06bKOzlLk3RvWhljoIzQQr3INcMS3UuSlcGgIu1EHuJzRXD8MW6xpTxHUdBS_Dk1gNFUTFxLXwRraq-rvU2OU2vdVZiY7nbpTmy81s5uFoFNMprhUdGBlo0Sj0pzW4kcJ1Hm7uxMoaZqFK9qTzugMspk7HoJYgrxP_db-vqXJGCZawqSKZ9R61ADVK2wrzUJIgwwCqbl4NLX2gGWgoeSwVaacGBNRZfZLguBWiiDDLGZ4GMPajlaGYTBHE3tJFPoImKiubVzPEQ_U5kt-z5B6wrvX8UdOSG9PfAO0Zm6QXPzX--RwoQ_DX3ZEhb8kxXkMlSEY1xeFYG5dkxd_lzvjj4AeVNDNDpJoMGUCvIEeK2Jehr_cz1iWwch879AmpoAP2CYl4YY2byomTEgrqC41qvX1hZlNXn_-2AD4pF3gwN0MsDKLlqH-O0qH6yEWkUji3PhqeEkK8nZ90wKS1ry0ChdvDbeZCBh-FwVMx9rUBoUp869HJrzBiLTCJ9_gBR8TbyUg0mt8WM7x6MVs4AYcxg2Dtyp9gcagDGSOhaYhNL_P1bPBCs33KLCc72XXA5EyECmxyduHIiS7j1bm3ifM4b9jw-Xr7noEHjeqdyrPLA5WjBBICGppWO3SR6g6Hr1eeUbg67coaL7yLAUMVN9RIq2i9KWw3OAFzDp-VBsirCvcER-xkpZSb1Lfk0l7W_X7f1SXtcQj98unnItOY_MYtUlvk7IROvK0SgpoYPSfMDxrg_TGnW5J0_kb9EQh0lMjAAmgpt_uELxt1VVdyoLebo6hhgLo8bSBjMX4rIZ20ADa3YM4DHgkkau9F1oUJ92xVBhUSBqtHHPbPSZbhOswyOm7AUpKkfD9TdczDuzPuHAF0PpX-0ZOM2WwF63QoxGMr2GxwtHABIVx_y9umaJUZ0h3QdOJC1snwpyAlOn9o_K504FGDSkj2SOSBjLlqDKUqCJOhiovfzXEPie7ku0KoiSohwR9elnpatp4Ay8rTKAn5Qs-ZBzKU3Lppa2dqExF91odVzXByF5yQLANhpW6M_-37qgZ1bk_SRxUJdF5Q-OyEHTWLVzy-7TJWBeRcFAnZywvp__iVUtcxZGyDrlce83CYCkry6UbLPbk1aX4fCs1HIx4N0AwYm6j28PlwH-mjENbZmytn3LinXDr835KOj4MI5APFE7jHl-2wajzvCSWP6dTw_A9wDc4vacrn3W-uU4fNa9MZu5Ub82gQ619rKHoBKf3ePTV_RurtK6Lf__4l4QIiThRU-rEWlBZZKpLIHVyA3DdVAXkdO0Pa8yWvJlyaUJPw3epXRA01rgws41fOFlYvazQuDBziG92OSYiZlRHSmWIkQYg3RxgGCqVfh561DfoEq4o_CGuMjJ3UXsOgVGDwmeYDPasjFOD-OpgoqWPVIe--38grzB5YSMVcUFq0CGYp9rScwUzFFUrjlUIlvWx-9nQhuPZi88XQGWTY4rM__M3Zx54Tcow-gwi7BABO7X5CILGi32_Ep5TZJrM9-Vb_KynQHc2pTgykgSAtFOQA6IiFberEp7R8vOiE9sAjeN2djASL0S23PrqjrR3_cvegz-3Qoxh4R-PpFWUC8ai_1jvthIogPVnfYJbsitYz_xK9qMihwp4FVSezKSSSDigCfJLmGo2eZfJ94qE-J_voPrfPDr154y1zsQswBkSmuHvmt2ulbd2iAovC1mJp7I1dXzZkB3MrJrV9-0he2S7QaMZuYIlyHInIA7Qs1xXEmN2cY1xvaBtWm39JInx6GOwAq1hxLy44d-Q_2_ysN_RJrDDHMGjfJH6C8hHk5Iw8IxwWIOy_zJdPztzZ-R-md6gM-FOcfnbxZPjtoGt5cUyV4dxntpkdI2lZ9X6rXDzQ3OSzXdr7Qpo_UOhb6TRzSmoKJxsIPhwzu7fvR6falbWbb7DhqLgWN2gzqOMyvbG6XUWHVaaeTocqXFEi3sdLHzVbVK1lRRWnwrbRgHm4GKtGr2UDzIZ8I50XPSismgthEFYUA3AxjnCrmGr9DY56_Ll5r_wlWrlX-YAdgLDNRqAJw-e2xVDNLc6ObLQK5nJXJLUG6G0D9WTPfu4PLY4Lmb7tRtdPPFq44vgHcKaUv5QTN8DfLt-cgypNTACwUMkTTDNls_NBzTPD7X2PG-O9g7DHzqDP1Dd_snPbBau6ZfoTE7HotukG8WjiDI4hGNTOPSCQJD2BsmkGKp_uHhgMcFkVVcPeGd11cRanYmyyB7mmIjIZKxNhqRIK0MtWq2rTKQVnOylAm1oUodo6ywdACN_0hyDIVWf7VRerw3R_MOlKCExrbHOj_vJjUEOcoM1mAjk903qtCGcanalTVwDDieqnw-4Urq2UOvFY0SIoRA76hLUnjt5b_yxkO97FgWewUdwsYOZ2s0l203-BByLplvw0FaCtUgFbBLi3ryBJo_wQskerUsin2-Y5vKWalgV9C8zAmE-ri9sWgFVpbj-gSTzP2KBfH6LYqmT-57tyhdQ0j5_6Sq7MsOGK_AqpbNO_g7U8P5mYCdSAA; ai_user=nxlt7|2019-10-13T09:40:25.815Z; .AspNetCore.Culture=c%3Dnl-NL%7Cuic%3Dnl-NL
${DossierID}    api/dossiers/0276dae3-7274-41ea-8f0e-e3d866b507f1

*** Test Cases ***
Get Detail Of Dossier
    create session  mysession   ${RootURL}
    ${headers}  create dictionary  Cookie=${Header_Cookie}
    ${respond}=  get request  mysession  api/dossiers/0276dae3-7274-41ea-8f0e-e3d866b507f1  headers=${headers}
    log  ${respond.status_code}
    log  ${respond.content}
    log  ${respond.headers}
    ${json_obj}=  to json  ${respond.content}
    ${test}=  get value from json  ${json_obj}  $.data
    log  ${test}
    # ${body}=  convert to string  ${respond.content}
    # log  ${body}
    # Should contain  ${body}  de nessermolen

Get list of dossier after filter
    Go To Dossiers
    Click Element  css:i.kol-dossiers-grid-view
    Get WebElements  //div[@data-automationid='DetailsRowFields']

    # create session  mysession   ${RootURL}
    # ${headers}  create dictionary  Cookie=${Header_Cookie}
    # ${respond}=  post request  mysession  api/dossiers/filter/unscheduledontop  headers=${headers}
    
    # ${count}=  Get Element Count  //div[@data-automationid='DetailsRowFields']
    ${rowList}=  Create List
    :FOR  ${i}  IN RANGE  200
    \  Scroll Element Into View    (//div[@data-automationid='DetailsRowFields'])[${i+1}]/div[@aria-colindex='2']
    \  ${Ref}=  Get text  (//div[@data-automationid='DetailsRowFields'])[${i+1}]/div[@aria-colindex='2']
    \  Append To List  ${rowList}  ${Ref}s
    Log  ${rowList}