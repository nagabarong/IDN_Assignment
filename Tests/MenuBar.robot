*** Settings ***
Library    Browser
Library    String
Resource   ../Resource/MenuBar.resource

*** Test Cases ***
Check Menu Bar Visibility
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}   
    New Page    ${URL}    wait_until=domcontentloaded

    # Check Quiz Menu
    ${quiz_menu}=    Get Element    ${MENU_QUIZ}
    ${quiz_link}=    Get Element    ${MENU_QUIZ_LINK}
    ${quiz_img}=    Get Element    ${MENU_QUIZ_IMG}
    Get Property    ${quiz_menu}    style.display    !=    none
    Get Property    ${quiz_link}    style.display    !=    none
    Get Property    ${quiz_img}    style.display    !=    none

    # Check News Menu
    ${news_menu}=    Get Element    ${MENU_NEWS}
    ${news_link}=    Get Element    ${MENU_NEWS_LINK}
    Get Property    ${news_menu}    style.display    !=    none
    Get Property    ${news_link}    style.display    !=    none

    # Check Business Menu
    ${business_menu}=    Get Element    ${MENU_BUSINESS}
    ${business_link}=    Get Element    ${MENU_BUSINESS_LINK}
    Get Property    ${business_menu}    style.display    !=    none
    Get Property    ${business_link}    style.display    !=    none

    # Check Sport Menu
    ${sport_menu}=    Get Element    ${MENU_SPORT}
    ${sport_link}=    Get Element    ${MENU_SPORT_LINK}
    Get Property    ${sport_menu}    style.display    !=    none
    Get Property    ${sport_link}    style.display    !=    none

    # Check Tech Menu
    ${tech_menu}=    Get Element    ${MENU_TECH}
    ${tech_link}=    Get Element    ${MENU_TECH_LINK}
    Get Property    ${tech_menu}    style.display    !=    none
    Get Property    ${tech_link}    style.display    !=    none

    # Check Hype Menu
    ${hype_menu}=    Get Element    ${MENU_HYPE}
    ${hype_link}=    Get Element    ${MENU_HYPE_LINK}
    Get Property    ${hype_menu}    style.display    !=    none
    Get Property    ${hype_link}    style.display    !=    none

    # Check Korea Menu
    ${korea_menu}=    Get Element    ${MENU_KOREA}
    ${korea_link}=    Get Element    ${MENU_KOREA_LINK}
    Get Property    ${korea_menu}    style.display    !=    none
    Get Property    ${korea_link}    style.display    !=    none

    # Check Life Menu
    ${life_menu}=    Get Element    ${MENU_LIFE}
    ${life_link}=    Get Element    ${MENU_LIFE_LINK}
    Get Property    ${life_menu}    style.display    !=    none
    Get Property    ${life_link}    style.display    !=    none

    # Check Health Menu
    ${health_menu}=    Get Element    ${MENU_HEALTH}
    ${health_link}=    Get Element    ${MENU_HEALTH_LINK}
    Get Property    ${health_menu}    style.display    !=    none
    Get Property    ${health_link}    style.display    !=    none

    Close Browser

Check Menu # (GenZMemilih) Link
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}   
    New Page    ${URL}    wait_until=domcontentloaded

    # Check GenZMemilih Link
    ${genz_link}=    Get Element    ${GENZ_MEMILIH_LINK}
    Get Property    ${genz_link}    style.display    !=    none
    ${href}=    Get Property    ${genz_link}    href
    Should Contain    ${href}    genzmemilih

    Click    ${genz_link}

    Wait For Elements State    ${GENZ_MEMILIH_LINK}    state=attached    timeout=10s

    @{pages}=    Browser.Get Page Ids
    ${last_page}=    Set Variable    ${pages}[-1]
    Switch Page    ${last_page}

    ${link_element}=    Get Element    ${GENZ_MEMILIH_LINK}
    ${href}=    Get Property    ${link_element}    href
    ${href}=    Replace String    ${href}    https://www.    https://
    ${expected_url}=    Replace String    ${GENZ_MEMILIH_URL}    https://www.    https://
    
    Should Be Equal    ${href}    ${expected_url}

    Close Browser
    
Check MenuBar Community
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}   
    New Page    ${URL}    wait_until=domcontentloaded
    # Check Community Menu
    ${community_menu}=    Get Element    ${MENU_COMMUNITY}
    ${community_link}=    Get Element    ${MENU_COMMUNITY_LINK}
    Get Property    ${community_menu}    style.display    !=    none
    Get Property    ${community_link}    style.display    !=    none
    Click    ${MENU_COMMUNITY_LINK}
    Get Url    *=    ${IDN_CONNECT_URL}

    Close Browser

Check Menubar Category
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}   
    New Page    ${URL}    wait_until=domcontentloaded

    # Check Lainnya dropdown menu
    ${lainnya_menu}=    Get Element    ${MENU_LAINNYA}
    Get Property    ${lainnya_menu}    style.display    !=    none

    # Function to show dropdown menu
    Show Dropdown Menu

    # Check Categories section
    ${categories_section}=    Get Element    ${MENU_CATEGORIES}
    Get Property    ${categories_section}    style.display    !=    none

    # Check all category links
    @{category_links}=    Create List
    ...    ${MENU_CAT_QNA} a    ${URL_CAT_QNA}
    ...    ${MENU_CAT_AUTOMOTIVE} a    ${URL_CAT_AUTOMOTIVE}
    ...    ${MENU_CAT_SCIENCE} a    ${URL_CAT_SCIENCE}
    ...    ${MENU_CAT_MEN} a    ${URL_CAT_MEN}
    ...    ${MENU_CAT_FOOD} a    ${URL_CAT_FOOD}
    ...    ${MENU_CAT_OPINION} a    ${URL_CAT_OPINION}
    ...    ${MENU_CAT_FICTION} a    ${URL_CAT_FICTION}
    ...    ${MENU_CAT_INDEX} a    ${URL_CAT_INDEX}
    ...    ${MENU_CAT_TRAVEL} a    ${URL_CAT_TRAVEL}

    FOR    ${selector}    ${expected_url}    IN    @{category_links}
        # Wait for element to be visible and stable
        Wait For Elements State    ${selector}    state=visible    timeout=20s
        ${element}=    Get Element    ${selector}
        Get Property    ${element}    style.display    !=    none
        ${href}=    Get Property    ${element}    href
        ${normalized_href}=    Normalize URL    ${href}
        ${normalized_expected}=    Normalize URL    ${expected_url}
        Should Be Equal    ${normalized_href}    ${normalized_expected}
        
        # Click and verify navigation
        Click    ${selector}
        ${current_url}=    Get Url
        ${normalized_current}=    Normalize URL    ${current_url}
        ${normalized_expected}=    Normalize URL    ${expected_url}
        
        # Handle Google ad vignette
        IF    "#google_vignette" in "${current_url}" or "chrome-error://" in "${current_url}"
            Sleep    5s    # Wait for vignette to fully load
            ${dismiss_button}=    Run Keyword And Return Status    Get Element    [aria-label="Tutup Iklan"]
            IF    ${dismiss_button}
                Click    [aria-label="Tutup Iklan"]
            ELSE
                ${dismiss_button}=    Run Keyword And Return Status    Get Element    div.btn.skip[role="button"]
                IF    ${dismiss_button}
                    Click    div.btn.skip[role="button"]
                ELSE
                    ${dismiss_button}=    Run Keyword And Return Status    Get Element    [aria-label="Close ad"]
                    IF    ${dismiss_button}
                        Click    [aria-label="Close ad"]
                    END
                END
            END
            Sleep    2s
            # Wait for the actual page to load
            Wait For Elements State    body    state=visible    timeout=20s
            ${current_url}=    Get Url
            ${normalized_current}=    Normalize URL    ${current_url}
        END
        
        Should Be Equal    ${normalized_current}    ${normalized_expected}
        Go Back
        Wait For Elements State    ${selector}    state=attached    timeout=20s
        # Show dropdown menu again
        Show Dropdown Menu
    END

    # Check Events section
    ${events_section}=    Get Element    ${MENU_EVENTS}
    Get Property    ${events_section}    style.display    !=    none

    # Check all event links
    @{event_links}=    Create List
    ...    ${MENU_EVENT1} a    ${URL_EVENT1}
    ...    ${MENU_EVENT2} a    ${URL_EVENT2}
    ...    ${MENU_EVENT3} a    ${URL_EVENT3}
    ...    ${MENU_EVENT4} a    ${URL_EVENT4}
    ...    ${MENU_EVENT5} a    ${URL_EVENT5}
    ...    ${MENU_EVENT6} a    ${URL_EVENT6}

    FOR    ${selector}    ${expected_url}    IN    @{event_links}
        # Wait for element to be visible and stable
        Wait For Elements State    ${selector}    state=visible    timeout=20s
        ${element}=    Get Element    ${selector}
        Get Property    ${element}    style.display    !=    none
        ${href}=    Get Property    ${element}    href
        ${normalized_href}=    Normalize URL    ${href}
        ${normalized_expected}=    Normalize URL    ${expected_url}
        Should Be Equal    ${normalized_href}    ${normalized_expected}
        
        # Click and verify navigation
        Click    ${selector}
        ${current_url}=    Get Url
        ${normalized_current}=    Normalize URL    ${current_url}
        ${normalized_expected}=    Normalize URL    ${expected_url}
        
        # Handle Google ad vignette
        IF    "#google_vignette" in "${current_url}" or "chrome-error://" in "${current_url}"
            Sleep    5s    # Wait for vignette to fully load
            ${dismiss_button}=    Run Keyword And Return Status    Get Element    [aria-label="Tutup Iklan"]
            IF    ${dismiss_button}
                Click    [aria-label="Tutup Iklan"]
            ELSE
                ${dismiss_button}=    Run Keyword And Return Status    Get Element    div.btn.skip[role="button"]
                IF    ${dismiss_button}
                    Click    div.btn.skip[role="button"]
                ELSE
                    ${dismiss_button}=    Run Keyword And Return Status    Get Element    [aria-label="Close ad"]
                    IF    ${dismiss_button}
                        Click    [aria-label="Close ad"]
                    END
                END
            END
            Sleep    2s
            # Wait for the actual page to load
            Wait For Elements State    body    state=visible    timeout=20s
            ${current_url}=    Get Url
            ${normalized_current}=    Normalize URL    ${current_url}
        END
        
        Should Be Equal    ${normalized_current}    ${normalized_expected}
        Go Back
        Wait For Elements State    ${selector}    state=attached    timeout=20s
        # Show dropdown menu again
        Show Dropdown Menu
    END

    Close Browser

*** Keywords ***
Show Dropdown Menu
    ${max_retries}=    Set Variable    3
    FOR    ${i}    IN RANGE    ${max_retries}
        Hover    ${MENU_LAINNYA_LINK}
        Sleep    2s
        ${is_visible}=    Run Keyword And Return Status    
        ...    Wait For Elements State    ${MENU_CATEGORIES}    state=visible    timeout=5s
        IF    ${is_visible}
            ${is_events_visible}=    Run Keyword And Return Status    
            ...    Wait For Elements State    ${MENU_EVENTS}    state=visible    timeout=5s
            IF    ${is_events_visible}
                RETURN
            END
        END
        Sleep    1s
    END
    Fail    Could not show dropdown menu after ${max_retries} attempts

Normalize URL
    [Arguments]    ${url}
    ${url}=    Replace String    ${url}    https://www.    https://
    ${url}=    Replace String    ${url}    http://www.    http://
    ${url}=    Replace String    ${url}    http://    https://
    RETURN    ${url}