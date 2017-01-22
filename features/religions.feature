Feature: Religions can be edited
	As a logged in user, when I navigate to /customers/id/edit, I should be able to see the edit page

  Background:
    Given sample data is loaded
      And I am logged in as "someone@xyz.org"
    When I navigate to customers edit page as "someone@xyz.org"
    Then I should see Edit Profile

    @poltergeist

    Scenario: Editing religions on the customer's profile edit page
      When I check "Christianity" and "Buddhism" from the religions checkboxes
      Then "Christianity" and "Buddhism" should be checked
      When I click on "Update Customer"
      Then the customer, with email "someone@xyz.org", should have religions set to "Christianity" and "Buddhism"
