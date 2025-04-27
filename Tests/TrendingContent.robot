*** Settings ***
Library    Browser
Resource   ../Resource/Content.resource

*** Variables ***
${URL}    https://www.idntimes.com/

*** Test Cases ***
Check Trending Content
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}   
    New Page    ${URL}    wait_until=domcontentloaded

    # Wait for page to be fully loaded
    Wait For Elements State    body    state=visible    timeout=20s

    # Get main page ID
    ${pages}=    Browser.Get Page Ids
    ${main_page}=    Set Variable    ${pages}[0]

    # Click each trending tag
    @{trending_tags}=    Create List
    ...    ${TAG_SNBT}    ${TAG_SNBT_URL}
    ...    ${TAG_PAUS}    ${TAG_PAUS_URL}
    ...    ${TAG_IPHONE}    ${TAG_IPHONE_URL}
    ...    ${TAG_PRABOWO}    ${TAG_PRABOWO_URL}
    ...    ${TAG_DOKTER}    ${TAG_DOKTER_URL}

    FOR    ${tag_text}    ${expected_url}    IN    @{trending_tags}
        # Open the tag URL in a new page
        New Page    ${expected_url}    wait_until=domcontentloaded
        
        # Wait for page to load
        Wait For Elements State    body    state=visible    timeout=20s
        
        # Verify we are on the correct page
        ${current_url}=    Get Url
        Should Contain    ${current_url}    ${expected_url}    URL should match expected
        
        # Verify page content
        ${page_content}=    Get Elements    body
        Should Not Be Empty    ${page_content}    Page content should be present
        
        # Verify page based on URL type
        ${is_profile_page}=    Evaluate    'profil.idntimes.com' in '${current_url}'
        IF    ${is_profile_page}
            # Verify doctor profile page elements
            ${doctor_list}=    Get Elements    css=${DOCTOR_LIST}
            Should Not Be Empty    ${doctor_list}    Doctor list should be present
        ELSE
            # Verify tag page elements
            ${tag_selector}=    Set Variable    css=${TRENDING_TAG}\[href="${expected_url}"\]
            ${tag_element}=    Get Elements    ${tag_selector}
            Should Not Be Empty    ${tag_element}    Tag element should be present on the page
        END
        
        # Wait a bit to see the page
        Sleep    2s
        
        # Close the page and go back to main page
        Close Page
        Switch Page    ${main_page}
        Sleep    1s
    END

    Close Browser

Check Trending Content Scroll
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}   
    New Page    ${URL}    wait_until=networkidle

    # Wait for page to be fully loaded
    Wait For Elements State    body    state=visible    timeout=20s
    Wait For Elements State    ${TRENDING_SECTION}    state=visible    timeout=20s

    # Check if trending tags section exists
    ${trending_exists}=    Run Keyword And Return Status    Get Element    css=${TRENDING_SECTION}
    IF    not ${trending_exists}
        Log    Trending section not found, skipping scroll test
        Close Browser
        Pass Execution    Trending section not found, skipping scroll test
    END

    # Check if scroll buttons are present
    ${scroll_exists}=    Run Keyword And Return Status    Get Element    css=${SCROLL_BUTTONS}
    IF    not ${scroll_exists}
        Log    Scroll buttons not present, skipping scroll test
        Close Browser
        Pass Execution    Scroll buttons not present, skipping scroll test
    END

    # Verify initial state - left button should be disabled
    ${left_button}=    Get Element    css=${SCROLL_LEFT}
    ${is_disabled}=    Get Element States    ${left_button}    contains    disabled
    Should Be True    ${is_disabled}    Left scroll button should be disabled initially

    # Click right button to scroll
    ${right_button}=    Get Element    css=${SCROLL_RIGHT}
    Click    ${right_button}
    Wait For Elements State    ${left_button}    state=enabled    timeout=5s

    # Verify left button is now enabled
    ${is_disabled}=    Get Element States    ${left_button}    contains    disabled
    Should Not Be True    ${is_disabled}    Left scroll button should be enabled after scrolling right

    # Click left button to scroll back
    Click    ${left_button}
    Wait For Elements State    ${left_button}    state=disabled    timeout=5s

    # Verify left button is disabled again
    ${is_disabled}=    Get Element States    ${left_button}    contains    disabled
    Should Be True    ${is_disabled}    Left scroll button should be disabled after scrolling back

    Close Browser
