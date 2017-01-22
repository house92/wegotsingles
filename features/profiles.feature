Feature: Profile can be edited
	As a logged in user, when I navigate to /customers/id/edit, I should be able to see the edit page

  Background:
    Given sample data is loaded
      And I am logged in as "someone@xyz.org"
    When I navigate to customers edit page as "someone@xyz.org"
    Then I should see Edit Profile

    @poltergeist

    Scenario: Editing smoker on the customer's profile edit page
      When I select "Non-Smoker" from "customer_profile_attributes_smoker"
      And I click on "Update Customer"
      Then the customer, with email "someone@xyz.org", should have smoker value set to "Non-Smoker"

    @poltergeist

    Scenario: Editing drinker on the customer's profile edit page
      When I select "Gin Guzzler" from "customer_profile_attributes_drinker"
      And I click on "Update Customer"
      Then the customer, with email "someone@xyz.org", should have drinker value set to "Gin Guzzler"

    @poltergeist

    Scenario: Editing education on the customer's profile edit page
      When I select "Genius" from "customer_profile_attributes_level_of_education"
      And I click on "Update Customer"
      Then the customer, with email "someone@xyz.org", should have education value set to "Genius"

    @poltergeist

    Scenario: Editing weights on the customer's profile edit page
      When I fill in "customer_profile_attributes_imperial" with "120"
      Then there should be "120" in "customer_profile_attributes_imperial"
        And there should be "55" in "customer_profile_attributes_metric"
      When I fill in "customer_profile_attributes_metric" with "60"
      Then there should be "60" in "customer_profile_attributes_metric"
        And there should be "132" in "customer_profile_attributes_imperial"
      When I click on "Update Customer"
      Then the customer, with email "someone@xyz.org", should have imperial value to equal "132.0"
        And the customer, with email "someone@xyz.org", should have metric value to equal "60.0"

    @poltergeist
    Scenario: Editing star sign on the customer's profile edit page
      When I select "Sagittarius" from "customer_profile_attributes_star_sign"
      And I click on "Update Customer"
      Then the customer, with email "someone@xyz.org", should have star sign value set to "Sagittarius"

    @poltergeist
    Scenario: Editing occupation on the customer's profile edit page
      When I select "Unemployed" from "customer_profile_attributes_occupation"
      And I click on "Update Customer"
      Then the customer, with email "someone@xyz.org", should have occupation value set to "Unemployed"
