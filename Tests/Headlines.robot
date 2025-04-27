*** Settings ***
Library    Browser
Resource    ../Resource/Headlines.resource

*** Test Cases ***
Check Headlines Hover Interaction
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page    ${URL}    wait_until=domcontentloaded
    Wait For Elements State    ${SIDE_HEADLINE_SECTION}    state=visible    timeout=10s
    Wait For Elements State    ${MAIN_HEADLINE_SECTION}    state=visible    timeout=10s

    # Check there are 5 side headlines
    ${side_count}=    Get Element Count    ${SIDE_HEADLINE_BOX}
    Should Be Equal As Integers    ${side_count}    5

    # For each side headline, hover and check main headline updates
    FOR    ${i}    IN RANGE    1    6
        ${side_title}=    Get Side Headline Title    ${i}
        Hover Side Headline    ${i}
        ${main_title}=    Get Main Headline Title    ${i}
        Should Be Equal    ${main_title}    ${side_title}
        # Assertion: title-side-headline text sama dengan title-headline text
        ${side_title_h3}=    Get Text    [data-testid="title-side-headline${i}"]
        ${main_title_h3}=    Get Text    [data-testid="main-headline"] .slick-slide[aria-hidden="false"] [data-testid="title-headline${i}"]
        Should Be Equal    ${main_title_h3}    ${side_title_h3}

        # Assertion: ketika diklik, menuju halaman yang sesuai
        ${side_link}=    Get Element    [data-testid="box-side-headline${i}"] a.box-panel
        ${expected_url}=    Get Property    ${side_link}    href
        Click    ${side_link}
        Wait Until Keyword Succeeds    10x    1s    Location Should Be    ${expected_url}
        ${current_url}=    Get Url
        Should Be Equal    ${current_url}    ${expected_url}
        Go Back
        Wait Until Keyword Succeeds    10x    2s    Wait For Elements State    ${SIDE_HEADLINE_SECTION}    state=visible    timeout=2s
    END

    Close Browser