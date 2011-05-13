Feature: sign in
  So that I can add patients and prescriptions
  As a administrator
  I want to be able to sign in and out

  Scenario: successful sign in
    Given there is a user with name "Fred", email "fred@example.com" and password "foofoo"
    When I go to the signin page
    And I fill in "fred@example.com" for "Email"
    And I fill in "foofoo" for "Password"
    And I press "Sign in"
    Then I should see "Fred"
    And I should see "Sign out"

  Scenario: links on home page are correct
    Given I am signed in as "Fred"
    When I go to the home page
    Then I should not see "Admin account request"

  Scenario: sign out
    Given I am signed in as "Fred"
    When I follow "Sign out"
    Then I should be on the home page
    And I should see "Sign in"
