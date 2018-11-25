@Login
Feature: Login
  As a demo actor
  I want to login to jenkins using demo credentials
  In order to demo project features

  Scenario: Successful login
    Given user is on home page
    When user correctly logins
    Then user is authenticated

