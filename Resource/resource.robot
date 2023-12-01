*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${browser}           Chrome
${base_url}          https://sepatucompass.com/
${popup_close}       //div[@class='close']
${button_login}      //a[@class='nav-link account-button']
${button_register}   //*[@id="__next"]/main/div/div[2]/div/div/div/div[1]/div[2]/button
${input_name}        //input[@id='name']
${name}              dedi baskoro
${input_email}       //div[@class="form-group col-12"]//input[@fdprocessedid="ccfzgc"]
${email_text}        henafrozen@gmail.com
${input_phone}       //input[@id='mobileNumber']
${phone}             082210346652
${input_dob}         //input[@id='dob']
${dob}               22121995
${input_password}    //label[text()='Password']
${pwd}               wina2212
${button_submit}     //button[@type='submit']
${button_shop}       //a[text()="Shop"]
${card_product}      //a[@as='/shop/retrograde-slip-on-kawung-cream-157']
${button_size}       //span[text()="41"]
${button_cart}       //button[@class='btn btn-primary    btn-block']
${button_checkout}   //span[text()="Proceed to Checkout"]

*** Keywords ***

User Open Browser
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    --disable-notifications
    Open Browser    ${base_url}    ${browser}    chrome_options=${chrome_options}
    Maximize Browser Window

User Register in Web
    Wait Until Element Is Visible    ${popup_close}   timeout= 10s
    Click Element    ${popup_close}
    Click Element    ${button_login}
    Wait Until Element Is Visible    ${button_register}
    Click Button    ${button_register}
    Input Text    ${input_name}    ${name}
    Input Text    ${input_email}    ${email_text}
    Input Text    ${input_phone}    ${phone}
    Input Text    ${input_dob}    ${dob}
    Input Text    ${input_password}    ${pwd}
    Wait Until Element Is Enabled    ${button_submit}

login to web
    Wait Until Element Is Visible    ${popup_close}   timeout= 10s
    Click Element    ${popup_close}
    Click Element    ${button_login}
    Wait Until Element Is Enabled    ${input_email}
    Input Text    ${input_email}    ${email_text}
    Input Text    ${input_password}    ${pwd}
    Click Button    ${button_submit}
Add Product to Cart
    Wait Until Element Is Visible    ${button_shop}
    Click Button    ${button_shop}
    Click Element    ${card_product}
    Wait Until Element Is Visible    ${button_size}
    Click Button    ${button_size}
    Click Button    ${button_cart}
    Click Button    ${button_checkout}