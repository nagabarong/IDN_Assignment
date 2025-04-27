*** Settings ***
Documentation   Verify that the latest news section



*** Variables ***
${URL}                              https://www.idntimes.com
${SECTION_LATEST}                    [data-testid="section-latest1"]
${SECTION_TITLE}                     [data-testid="section-title1"]
${MAIN_LATEST}                       [data-testid="main-latest1"]
${BOX_MAIN_LATEST}                   [data-testid="box-main-latest1"]
${BOX_LATEST_NEWS}                   [data-testid="box-latest-news"]
${EXPECTED_ARTICLE_COUNT}            10
${LINK_MAIN_LATEST}                 [data-testid="link-main-latest1"]
${LINK_LATEST_NEWS}                 [data-testid="link-latest-news"]
${SEE_MORE_LINK}                    ${SECTION_LATEST} >> [data-testid="see-more-latest"]
${NEWS_PAGE_URL}                    https://www.idntimes.com/news
${BROWSER}                          chromium
${HEADLESS}                         false
${VIEWPORT_WIDTH}                   1920
${VIEWPORT_HEIGHT}                  1080
${WAIT_TIMEOUT}                     30s
${PAGE_LOAD_STRATEGY}               domcontentloaded
${RETRY_COUNT}                      3
${RETRY_INTERVAL}                   5s
${INITIAL_DELAY}                    5s
