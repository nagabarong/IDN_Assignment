*** Settings ***
Library    Browser
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

    # Check Community Menu
    ${community_menu}=    Get Element    ${MENU_COMMUNITY}
    ${community_link}=    Get Element    ${MENU_COMMUNITY_LINK}
    Get Property    ${community_menu}    style.display    !=    none
    Get Property    ${community_link}    style.display    !=    none

    Close Browser