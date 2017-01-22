Feature: A customer provides a username
  As an unregistered user, I should be rquired to create a username when registering for the site

  @wip
  @poltergeist
  Scenario: Inputting a username when registering
    When I navigate to the sign up page
    Then I should see the username input form
      And I should be required to input a username when registering
