*** Settings ***
Library   SeleniumLibrary
Resource  ../Resource/resource.robot

*** Test Case ***
Scenario: Add Product to Cart
    Given user open browser
    When user register in web
    Then add product to cart