Feature: A customer creates an account
  As an unregistered customer, I should be able to register for an account

  @wip
  @selenium
  Scenario: A customer is required to create a username when registering for the site
    When I navigate to "/customers/sign_up"
    Then I should see the "Username" input form
      And I should be required to fill in "customer_username" with a "Username" when registering

  @wip
  @selenium
  Scenario: A customer is required to add their date of birth when registering for the site
    When I navigate to "/customers/sign_up"
    Then I should see the "Date of Birth" input form
      And I should be required to fill in "customer[date_of_birth]" with a "Date of birth" when registering
      And I should need to be at least 18 years old to register for the service
