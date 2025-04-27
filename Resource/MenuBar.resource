*** Settings ***
Documentation   MenuBar Resource


*** Variables ***
${URL}    https://www.idntimes.com/

${MENU_QUIZ}    [data-testid="menu-quiz"]
${MENU_QUIZ_LINK}    [data-testid="menu-quiz-link"]
${MENU_QUIZ_IMG}    [data-testid="menu-quiz-img"]

${MENU_NEWS}    [data-testid="menu-news"]
${MENU_NEWS_LINK}    [data-testid="menu-news-link"]

${MENU_BUSINESS}    [data-testid="menu-business"]
${MENU_BUSINESS_LINK}    [data-testid="menu-business-link"]

${MENU_SPORT}    [data-testid="menu-sport"]
${MENU_SPORT_LINK}    [data-testid="menu-sport-link"]

${MENU_TECH}    [data-testid="menu-tech"]
${MENU_TECH_LINK}    [data-testid="menu-tech-link"]

${MENU_HYPE}    [data-testid="menu-hype"]
${MENU_HYPE_LINK}    [data-testid="menu-hype-link"]

${MENU_KOREA}    [data-testid="menu-korea"]
${MENU_KOREA_LINK}    [data-testid="menu-korea-link"]

${MENU_LIFE}    [data-testid="menu-life"]
${MENU_LIFE_LINK}    [data-testid="menu-life-link"]

${MENU_HEALTH}    [data-testid="menu-health"]
${MENU_HEALTH_LINK}    [data-testid="menu-health-link"]

${MENU_COMMUNITY}    [data-testid="menu-community"]
${MENU_COMMUNITY_LINK}    [data-testid="menu-community-link"]

${GENZ_MEMILIH_LINK}    a[href="https://genzmemilih.idntimes.com"]
${GENZ_MEMILIH_URL}    https://www.genzmemilih.idntimes.com/
${GENZ_MEMILIH_TEXT}    #GenZMemilih
${GENZ_MEMILIH_Logo}    [data-testid="linkElement"]

${IDN_CONNECT_URL}    connect.idn.media 

# Lainnya Menu Variables
${MENU_LAINNYA_LINK}    a.dropdown-icon-corner:has-text("Lainnya")
${MENU_LAINNYA}    [data-testid="dropdown-submenu-more"]
${MENU_CATEGORIES}    [data-testid="dropdown-menu-cat"]
${MENU_EVENTS}    [data-testid="dropdown-menu-campaign"]

# Category Links
${MENU_CAT_QNA}    [data-testid="menu-cat-qna"]
${MENU_CAT_AUTOMOTIVE}    [data-testid="menu-cat-automotive"]
${MENU_CAT_SCIENCE}    [data-testid="menu-cat-science"]
${MENU_CAT_MEN}    [data-testid="menu-cat-men"]
${MENU_CAT_FOOD}    [data-testid="menu-cat-food"]
${MENU_CAT_OPINION}    [data-testid="menu-cat-opinion"]
${MENU_CAT_FICTION}    [data-testid="menu-cat-fiction"]
${MENU_CAT_INDEX}    [data-testid="menu-cat-index"]
${MENU_CAT_TRAVEL}    [data-testid="menu-cat-travel"]

# Category URLs
${URL_CAT_QNA}    https://tanyajawab.idntimes.com/
${URL_CAT_AUTOMOTIVE}    https://www.idntimes.com/automotive
${URL_CAT_SCIENCE}    https://www.idntimes.com/science
${URL_CAT_MEN}    https://www.idntimes.com/men
${URL_CAT_FOOD}    https://www.idntimes.com/food
${URL_CAT_OPINION}    https://www.idntimes.com/opinion
${URL_CAT_FICTION}    https://www.idntimes.com/fiction
${URL_CAT_INDEX}    https://www.idntimes.com/index
${URL_CAT_TRAVEL}    https://www.idntimes.com/travel

# Event Links
${MENU_EVENT1}    [data-testid="menu-event1"]
${MENU_EVENT2}    [data-testid="menu-event2"]
${MENU_EVENT3}    [data-testid="menu-event3"]
${MENU_EVENT4}    [data-testid="menu-event4"]
${MENU_EVENT5}    [data-testid="menu-event5"]
${MENU_EVENT6}    [data-testid="menu-event6"]

# Event URLs
${URL_EVENT1}    https://ada100cara.idntimes.com/
${URL_EVENT2}    https://ichoosemychoice.idntimes.com/
${URL_EVENT3}    https://akuperempuan.idntimes.com/
${URL_EVENT4}    https://kitaidn.idntimes.com/
${URL_EVENT5}    https://liputankhusus.idntimes.com/
${URL_EVENT6}    https://idgaf.idntimes.com/
