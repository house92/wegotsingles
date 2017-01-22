Feature: A customer clicks on a page
  As an unregistered user, I should be able to click on header link that takes me to different pages

  @poltergeist
  Scenario: Seeing Success Stories Page
    When I navigate to the success stories page
    Then I should see Success Stories
      And I should see the image "kateleo.jpg"
