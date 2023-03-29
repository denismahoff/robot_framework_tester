*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/resources.robot
Variables    ../resources/variables.py

*** Test Cases ***
Standart user login Test Case
    [Setup]    Open Browser and Maximize    ${url}    ${browser_name}
    [Teardown]    Close Browser and Log
    Login to webpage    ${standard_user}    ${password}

Standart user add product to cart Test Case
    [Setup]    Open Browser and Maximize    ${url}    ${browser_name}
    [Teardown]    Close Browser and Log
    Login to webpage    ${standard_user}    ${password}
    Add product to card    ${product_name_bp}   ${product_price_bp}    ${add_btn_bp}
    Open shopping cart

Standart user add more product to cart Test Case
    [Setup]    Open Browser and Maximize    ${url}    ${browser_name}
    [Teardown]    Close Browser and Log
    Login to webpage    ${standard_user}    ${password}
    Add product to card    ${product_name_bp}   ${product_price_bp}    ${add_btn_bp}
    Add product to card    ${product_name_ts}   ${product_price_ts}    ${add_btn_ts}
    Open shopping cart

Full check flow buying product Test Case
    [Setup]    Open Browser and Maximize    ${url}    ${browser_name}
    [Teardown]    Close Browser and Log
    Login to webpage    ${standard_user}    ${password}
    Add product to card    ${product_name_bp}   ${product_price_bp}    ${add_btn_bp}
    Open shopping cart
    checkout shopping cart    Denis    Makhov    446012

Check sorting method Test Case
    [Setup]    Open Browser and Maximize    ${url}    ${browser_name}
    [Teardown]    Close Browser and Log
    Login to webpage    ${standard_user}    ${password}
    Change sorting method    ${hilo}

Locked out user login Test Case
    [Setup]    Open Browser and Maximize    ${url}    ${browser_name}
    [Teardown]    Close Browser and Log
    Login to webpage    ${locked_out_user}    ${password}