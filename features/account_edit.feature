Feature: A customer edits an account
  As a registered customer, I should be able to edit an account

  Background:
    Given sample data is loaded
      And I am signed in as "singleman@test.com"

  @poltergeist
  Scenario: A customer is able to edit their date of birth in their account
    When I navigate to "/customers/edit"
    Then I should see the "Date of Birth" input form
    When I enter a new date of birth into the Date of Birth field
      And I enter current password into the current password field
      And I click on "Update"
    Then the current user's date of birth should be updated