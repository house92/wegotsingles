Feature: Search
  As a logged in customer, I should be able to search for other customers based on gender.
  As a logged in customer, I should be able to search for other customers based on age.
  As a logged in customer, I should be able to search for other customers based on location.
  As a logged in customer, I should be able to search for other customers based on ethinicity.
  As a logged in customer, I should be able to search for other customers based on religion.
  As a logged in customer, I should be able to search for other customers based on languages.
  As a logged in customer, I should be able to search for other customers based on education.
  As a logged in customer, I should be able to search for other customers based on industry.
  As a logged in customer, I should be able to search for other customers based on a combination of parameters.

  Background:
    Given sample data is loaded
      And I am logged in as "someone@xyz.org"
      And I navigate to the profiles index

  @poltergeist
  Scenario: Filtering search results based on gender
    When I select "Male" from the "filterrific_with_gender" dropdown
    Then I should see "Bob"
      And I should not see "Gertrude"