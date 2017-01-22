Feature: Conversation
  As a logged in premium user, I should be able to initiate a conversation with another user.

  Background:
    Given sample data is loaded
      And I am signed in as "lightning@asgard.gov"
      And I navigate to the profile of user "singlewoman@test.com"
      And I click on "Send message"
      And I fill in "modal-message-text-area" with "Let's get down to business!"
      And I click on "send-message-button"

  @poltergeist
  Scenario: Initiating a conversation with another user
    Then there should be a conversation with the sender_id of "lightning@asgard.gov" and the receiver_id of "singlewoman@test.com"
      And the conversation between "lightning@asgard.gov" and "singlewoman@test.com" should have a latest message with a body of "Let's get down to business!"

  @poltergeist
  Scenario: Deleting a message
    When I navigate to the profile of user "singlewoman@test.com"
      And I click on "Send message"
    Then I should see "send-message-button"
    When I fill in "modal-message-text-area" with "Let's get down to business!"
      And I click on "send-message-button"


  # PASSING BUT SELENIUM TAKES AN AGE
  @wip
  @selenium
  Scenario: Viewing message inbox
    When I navigate to my inbox as "lightning@asgard.gov"
    Then I should see "Your messages"
      And I should see "Conversation with Gertrude"

  # PASSING BUT SELENIUM TAKES AN AGE
  @wip
  @selenium
  Scenario: Clicking on a conversation
    When I navigate to my inbox as "lightning@asgard.gov"
      And I click on "Conversation with Gertrude"
    Then I should see "Let's get down to business!"
      And I should see "message right"


  # PASSING BUT SELENIUM TAKES AN AGE
  @wip
  @selenium
  Scenario: Replying to a message
    Given I am signed in as "singlewoman@test.com"
    When I navigate to my inbox as "singlewoman@test.com"
      And I click on "Conversation with Bob"
      And I fill in "message-text-area" with "It won't cost much. Just your voice!"
      And I click on "send-message-button"
    Then the conversation between "lightning@asgard.gov" and "singlewoman@test.com" should have a latest message with a body of "It won't cost much. Just your voice!"
      And I should see "It won't cost much. Just your voice!"

  @poltergeist
  Scenario: Following a link to latest message
    When I click on "SIGN OUT"
      And I follow the link "/customers/<RECIPIENTsinglewoman@test.com>/messages?contact_id=<SENDERlightning@asgard.gov>&login_token=<token>"
    Then I should see "Let's get down to business!"
      And I should not see "message right"

  @poltergeist
  Scenario: Deleting a conversation
    When I navigate to my inbox as "lightning@asgard.gov"
      And I click on "DELETE"
    Then there should not be a conversation with the sender_id of "lightning@asgard.gov" and the receiver_id of "singlewoman@test.com"
      And I should not see "Conversation with Gertrude"

  @poltergeist
  Scenario: Attempting auto-login with an invalid token
  When I click on "SIGN OUT"
    And I follow the link "/customers/<RECIPIENTsinglewoman@test.com>/messages?contact_id=<SENDERlightning@asgard.gov>&login_token=1234"
  Then I should not see "Let's get down to business!"
    And I should see "JOIN TODAY!"
