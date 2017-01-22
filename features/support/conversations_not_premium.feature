Feature: Conversation
  As a logged in male user without a premium account, I should be unable to send messages.

  Background:
    Given sample data is loaded
      And I am signed in as "singleman@test.com"
      And I navigate to the profile of user "singlewoman@test.com"
      And I click on "Send message"
      And I fill in "modal-message-text-area" with "Let's get down to business!"
      And I click on "send-message-button"

  @poltergeist
  Scenario: Attempting to send a message
    Then I should see "Only premium members may send messages to other members. Please upgrade your account."
      And there should not be a conversation with the sender_id of "singleman@test.com" and the receiver_id of "singlewoman@test.com"
