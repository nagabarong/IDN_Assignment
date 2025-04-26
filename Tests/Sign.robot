*** Settings ***
Library    Browser
Resource   ../Resource/Account.robot

*** Test Cases ***
Check Sign button clickable
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}   
    New Page    ${URL}    wait_until=domcontentloaded
    Get Element    ${LG_BTN}
    Click    ${LG_BTN}
    Get Url    *=    ${IDN_CONNECT_URL}
    Close Browser

