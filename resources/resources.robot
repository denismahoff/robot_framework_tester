*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Browser and Maximize
    [Arguments]    ${user_url}    ${user_browser}
    open browser    ${user_url}    ${user_browser}
    maximize browser window
    log    Starting Test with ${user_browser}}
    log    Test URL: ${user_url}}

Close Browser and Log
    close browser
    log    Finished test.

Login to webpage
    set screenshot directory    ../screenshots
    [Arguments]    ${user_name}    ${user_password}
    input text    id:user-name    ${user_name}
    input password    id:password    ${user_password}
    click button    id:login-button
    log    name: {user_name}, password: {user_password}
    location should be    https://www.saucedemo.com/inventory.html
    capture page screenshot

Logout from webpage
    click button    id:react-burger-menu-btn
    wait until element is visible    id:logout_sidebar_link
    click link    id:logout_sidebar_link
    location should be    https://www.saucedemo.com/

Change sorting method
    set screenshot directory    ../screenshots
    [Arguments]    ${sorting_method}
    select from list by value    class:product_sort_container    ${sorting_method}
    capture page screenshot

Add product to card
    [Arguments]    ${product_id}    ${product_price_id}    ${add_bt_id}
    ${product_name}=    get text    xpath:${product_id}
    ${product_price}=    get text    xpath:${product_price_id}
    log    Product name: ${product_name}
    log    Product price: ${product_price}
    ${add_bt}=    click button    id:${add_bt_id}
#    page should contain element    id:remove-sauce-labs-backpack

Remove product to card
    [Arguments]    ${remove_product_id}
    ${rem_product_id}=    click button    id:${remove_product_id}

Open shopping cart
    set screenshot directory    ../screenshots
    click link    class:shopping_cart_link
    capture element screenshot    xpath://*[@id="cart_contents_container"]

Checkout shopping cart
    set screenshot directory    ../screenshots
    [Arguments]    ${fname}    ${lname}    ${postalcode}
    click button    id:checkout
    input text    id:first-name    ${fname}
    input text    id:last-name    ${lname}
    input text    id:postal-code    ${postalcode}
    click button    id:continue
    capture element screenshot    id:root
    click button    id:finish
    location should be    https://www.saucedemo.com/checkout-complete.html
    capture page screenshot
