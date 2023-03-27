*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/resources.robot
Variables    ../resources/variables.py

*** Test Cases ***
Standart user add product to cart Test Case
    [Setup]    Open Browser and Maximize    ${url}    ${browser_name}
    [Teardown]    Close Browser and Log
    Login to webpage    ${standard_user}    ${password}
    Add product to card    ${product_name_slb}   ${product_price_slb}    ${add_btn_slb}
    Open shopping cart

Locked out user login Test Case
    [Setup]    Open Browser and Maximize    ${url}    ${browser_name}
    [Teardown]    Close Browser and Log
    Login to webpage    ${locked_out_user}    ${password}
