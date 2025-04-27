*** Settings ***
Documentation     Test suite for verifying trending news section
Resource          ../Resource/TrendingNews.resource
Library           Collections

*** Test Cases ***
Verify Trending News Section
    [Documentation]    Verify the trending news section displays correctly
    [Tags]    trending    regression
    
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}   
    New Page    ${URL}    wait_until=domcontentloaded
    
    # Wait for page to load completely
    Sleep    5s
    
    # Scroll to trending section
    ${trending_element}=    Get Element    ${LIST_TRENDING}
    Scroll To Element    ${trending_element}
    Sleep    2s
    
    # Verify section title
    Verify Trending Section Title
    
    # Wait for trending section to be visible
    Wait For Elements State    ${LIST_TRENDING}    visible    timeout=10s
    
    # Verify number of non-cloned articles (should be 10)
    ${slide_count}=    Get Non Cloned Slides Count
    Should Be Equal As Numbers    ${slide_count}    10
    Log    Found ${slide_count} non-cloned trending articles
    
    # Verify each article is clickable and loads correctly
    FOR    ${index}    IN RANGE    1    11
        ${locator}=    Get Article Link Locator    ${index}
        ${element}=    Get Element    ${locator}
        ${href}=    Get Attribute    ${element}    href
        Log    Article ${index} link: ${href}
        
        # Click the article
        Click    ${element}
        Sleep    2s
        
        # Verify URL matches the href
        ${current_url}=    Get Url
        Should Be Equal    ${current_url}    ${href}
        Log    Successfully loaded article ${index}
        
        # Go back to main page
        Go Back
        Sleep    2s
    END
    
    # Close browser
    Close Browser

