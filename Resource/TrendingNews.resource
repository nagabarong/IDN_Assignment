*** Settings ***
Library    Browser

*** Variables ***
${URL}                          https://www.idntimes.com/
${TRENDING_SECTION_TITLE}       [data-testid="title-berita-terpopuler"] span
${LIST_TRENDING}                .list-trending
${ARTICLE_LINK_TEMPLATE}        div.slick-slide:not(.slick-cloned) div[data-testid="box-trending%s"] a.box-panel

*** Keywords ***
Open Browser And Navigate
    New Browser    chromium    headless=False
    New Page    ${URL}

Get Non Cloned Slides Count
    ${count}=    Set Variable    0
    FOR    ${index}    IN RANGE    1    11
        ${locator}=    Set Variable    div.slick-slide:not(.slick-cloned) div[data-testid="box-trending${index}"]
        ${exists}=    Run Keyword And Return Status    Get Element    ${locator}
        IF    ${exists}
            ${count}=    Evaluate    ${count} + 1
            Log    Found non-cloned article ${index}
        END
    END
    Log    Total non-cloned articles: ${count}
    RETURN    ${count}

Verify Trending Section Title
    Wait For Elements State    ${TRENDING_SECTION_TITLE}    visible    timeout=10s
    ${actual_text}=    Get Text    ${TRENDING_SECTION_TITLE}
    Log    Actual text found: "${actual_text}"
    ${actual_text}=    Evaluate    """${actual_text}""".strip()
    Log    Stripped text: "${actual_text}"
    Should Be Equal    ${actual_text}    BERITA TERPOPULER

Get Article Link Locator
    [Arguments]    ${index}
    ${locator}=    Evaluate    """${ARTICLE_LINK_TEMPLATE}""" % ${index}
    RETURN    ${locator}
