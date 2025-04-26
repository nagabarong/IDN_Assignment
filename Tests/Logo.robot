*** Settings ***
Library    Browser
Resource   ../Resource/PageOverview.robot

*** Test Cases ***
Check IDN Times Logo Is Visible/Clickable
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}   
    New Page    ${URL}    wait_until=domcontentloaded
    Wait For Elements State    ${LOGO_SEL}    visible    timeout=30s
    ${states}=    Get Element States    ${LOGO_SEL}
    Should Contain    ${states}    visible
    Click    ${LOGO_SEL}
    Get Url    ==    ${URL}
    Close Browser

