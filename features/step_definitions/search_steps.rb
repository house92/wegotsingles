Given(/^I navigate to the profiles index$/) do
  visit "profiles"
end

When(/^I select "([^"]*)" from the "([^"]*)" dropdown$/) do |value, list|
  select(value, from: list)
end
