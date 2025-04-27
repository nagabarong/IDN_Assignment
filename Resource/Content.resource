*** Settings ***
Documentation       Content Trending Tags Data
Library    Browser

*** Variables ***
${URL}    https://www.idntimes.com/

# Trending Content Section
${TRENDING_SECTION}    #content-trending-tags.section__trending_tags
${TRENDING_TITLE}    .title__section_trending
${TRENDING_TAGS_LIST}    .trending_tag_list
${TRENDING_TAG}    a.btn.btn-tag.trending-tag-tracker

# Trending Tags
${TAG_SNBT}    SNBT 2025
${TAG_SNBT_URL}    https://www.idntimes.com/tag/snbt-2025
${TAG_PAUS}    paus fransiskus
${TAG_PAUS_URL}    https://www.idntimes.com/tag/paus-fransiskus
${TAG_IPHONE}    iPhone 16
${TAG_IPHONE_URL}    https://www.idntimes.com/tag/iphone-16
${TAG_PRABOWO}    Prabowo Subianto
${TAG_PRABOWO_URL}    https://www.idntimes.com/tag/prabowo-subianto
${TAG_DOKTER}    Profil Dokter
${TAG_DOKTER_URL}    https://profil.idntimes.com/

# Doctor Profile Page
${DOCTOR_LIST}    div[role="list"] div[role="listitem"]

# Scroll Buttons
${SCROLL_BUTTONS}    .wrapper__btn_scroll
${SCROLL_LEFT}    #scroll_left
${SCROLL_RIGHT}    #scroll_right
