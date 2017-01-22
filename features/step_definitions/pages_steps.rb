When(/^I navigate to the success stories page$/) do
  visit '/success-stories'
end


Then(/^I should see Success Stories$/) do
  expect(page).to have_content('SUCCESS STORIES')
end

Then(/^I should see the image "([^"]*)"$/) do |image|
  page.should have_xpath("//img[contains(@src, \"#{image}\")]")
end
