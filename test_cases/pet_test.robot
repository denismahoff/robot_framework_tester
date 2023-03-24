*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/resources.robot
Variables    ../resources/variables.py

*** Test Cases ***
Standart user add product to cart Test Case
    [Setup]    Open Browser and Maximize    ${url}    ${browser_name}
    [Teardown]    Close Browser and Log
    Login to webpage    ${standard_user}    ${password}
    Add product to card    //*[@id="item_4_title_link"]/div    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div    add-to-cart-sauce-labs-backpack
    sleep    3
    Open shopping cart

Locked out user login Test Case
    [Setup]    Open Browser and Maximize    ${url}    ${browser_name}
    [Teardown]    Close Browser and Log
    Login to webpage    ${locked_out_user}    ${password}
