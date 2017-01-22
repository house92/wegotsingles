Feature: Ethnicities can be edited
	As a logged in user, when I navigate to /customers/id/edit, I should be able to see the edit page

  Background:
    Given sample data is loaded
      And I am logged in as "someone@xyz.org"
    When I navigate to customers edit page as "someone@xyz.org"
    Then I should see Edit Profile

    @poltergeist

    Scenario: Editing ethnicities on the customer's profile edit page
      When I check "European" and "Other" from the ethnicities checkboxes
      Then "European" and "Other" should be checked
      When I click on "Update Customer"
      Then the customer, with email "someone@xyz.org", should have ethnicities set to "European" and "Other"
