*** Settings ***
Library    Browser

*** Variables ***
${URL}    https://www.idntimes.com/
${MAIN_HEADLINE_SECTION}    [data-testid="main-headline"]
${SIDE_HEADLINE_SECTION}    [data-testid="side-headline"]
${SIDE_HEADLINE_BOX}    [data-testid^="box-side-headline"]
${MAIN_HEADLINE_BOX}    [data-testid^="box-headline"]

*** Keywords ***
Hover Side Headline
    [Arguments]    ${index}
    Hover    [data-testid="box-side-headline${index}"]
    Sleep    1s

Get Main Headline Title
    [Arguments]    ${index}
    ${selector}=    Set Variable    [data-testid="main-headline"] .slick-slide[aria-hidden="false"] [data-testid="box-headline${index}"] h3.title-text
    ${title}=    Get Text    ${selector}
    RETURN    ${title}

Get Side Headline Title
    [Arguments]    ${index}
    ${selector}=    Set Variable    [data-testid="box-side-headline${index}"] h3.title-text
    ${title}=    Get Text    ${selector}
    RETURN    ${title}

Location Should Be
    [Arguments]    ${expected_url}
    ${current_url}=    Get Url
    Should Be Equal    ${current_url}    ${expected_url}
