*** Settings ***
Resource    ../Resource/LatestNews.resource
Library    Browser

*** Test Cases ***
Verify Latest News Article Count
    [Tags]    latest_news    article_count

    # Setup browser
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}   
    New Page    ${URL}    wait_until=domcontentloaded
    
    # Wait for the latest news section to be visible
    Wait For Elements State    ${SECTION_LATEST}    visible    timeout=30s
    
    # Scroll to the latest news section
    Scroll To Element    ${SECTION_LATEST}
    
    # Get all articles
    ${main_articles}=    Get Elements    ${BOX_MAIN_LATEST}
    ${latest_articles}=    Get Elements    ${BOX_LATEST_NEWS}
    
    # Get the count of articles
    ${main_count}=    Get Length    ${main_articles}
    ${latest_count}=    Get Length    ${latest_articles}
    ${total_articles}=    Evaluate    ${main_count} + ${latest_count}
    
    # Verify the total count
    Should Be Equal As Numbers    ${total_articles}    ${EXPECTED_ARTICLE_COUNT}    The latest news section should contain exactly 10 articles
    
    # Verify that main latest section has exactly 2 articles
    Should Be Equal As Numbers    ${main_count}    2    The main latest section should contain exactly 2 articles

    Close Browser

Verify Main Articles Navigation
    [Tags]    latest_news    navigation    main_articles

    # Setup browser
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}   
    New Page    ${URL}    wait_until=domcontentloaded
    
    # Wait for the latest news section to be visible
    Wait For Elements State    ${SECTION_LATEST}    visible    timeout=30s
    
    # Scroll to the latest news section
    Scroll To Element    ${SECTION_LATEST}
    
    # Get main articles
    ${main_articles}=    Get Elements    ${BOX_MAIN_LATEST}
    ${main_count}=    Get Length    ${main_articles}

    # Verify main articles are clickable and navigate correctly
    FOR    ${index}    IN RANGE    ${main_count}
        ${article}=    Get Element    ${BOX_MAIN_LATEST} >> nth=${index}
        ${href}=    Get Attribute    ${article} >> ${LINK_MAIN_LATEST}    href
        Click    ${article} >> ${LINK_MAIN_LATEST}
        ${current_url}=    Get Url
        Should Be Equal    ${current_url}    ${href}
        
        # Go back to homepage
        Go To    ${URL}    wait_until=domcontentloaded
        
        # Wait and scroll
        Wait For Elements State    ${SECTION_LATEST}    visible    timeout=30s
        Scroll To Element    ${SECTION_LATEST}
        Wait For Elements State    ${article}    visible    timeout=30s
        Scroll To Element    ${article}
    END

    Close Browser

Verify Latest News Articles Navigation
    [Tags]    latest_news    navigation    latest_articles

    # Setup browser
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}   
    New Page    ${URL}    wait_until=domcontentloaded
    
    # Wait for the latest news section to be visible
    Wait For Elements State    ${SECTION_LATEST}    visible    timeout=30s
    
    # Scroll to the latest news section
    Scroll To Element    ${SECTION_LATEST}
    
    # Get latest articles
    ${latest_articles}=    Get Elements    ${BOX_LATEST_NEWS}
    ${latest_count}=    Get Length    ${latest_articles}

    # Verify latest news articles are clickable and navigate correctly
    FOR    ${index}    IN RANGE    ${latest_count}
        ${article}=    Get Element    ${BOX_LATEST_NEWS} >> nth=${index}
        ${href}=    Get Attribute    ${article} >> ${LINK_LATEST_NEWS}    href
        Click    ${article} >> ${LINK_LATEST_NEWS}
        ${current_url}=    Get Url
        Should Be Equal    ${current_url}    ${href}
        
        # Go back to homepage
        Go To    ${URL}    wait_until=domcontentloaded
        
        # Wait and scroll
        Wait For Elements State    ${SECTION_LATEST}    visible    timeout=30s
        Scroll To Element    ${SECTION_LATEST}
        Wait For Elements State    ${article}    visible    timeout=30s
        Scroll To Element    ${article}
    END

    Close Browser

Verify See More Link Navigation
    [Tags]    latest_news    navigation    see_more

    # Setup browser
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}   
    New Page    ${URL}    wait_until=domcontentloaded
    
    # Wait for the latest news section to be visible
    Wait For Elements State    ${SECTION_LATEST}    visible    timeout=30s
    
    # Scroll to the latest news section
    Scroll To Element    ${SECTION_LATEST}
    
    # Wait for the see more link to be visible
    Wait For Elements State    ${SEE_MORE_LINK}    visible    timeout=30s
    
    # Scroll to the see more link
    Scroll To Element    ${SEE_MORE_LINK}
    
    # Click the see more link
    Click    ${SEE_MORE_LINK}
    
    # Verify we are on the news page
    ${current_url}=    Get Url
    Should Be Equal    ${current_url}    ${NEWS_PAGE_URL}
    
    # Go back to homepage
    Go To    ${URL}    wait_until=domcontentloaded

    Close Browser