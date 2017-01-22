Feature: Altering customer preferences
  As a logged in user, I should be able to alter my personal preferences

  Background:
    Given sample data is loaded
      And I am signed in as "lightning@asgard.gov"
      And I navigate to "/"

  @poltergeist
  Scenario: Altering unit of weight preference
    When I click on "PROFILE"
      And I click on "Preferences"
    Then I should see "Preferred unit format:"
    When I select "Metric" from "preference_metric"
      And I click on "Update Preference"
    Then I should see "kg"
      And I should not see "lb"
