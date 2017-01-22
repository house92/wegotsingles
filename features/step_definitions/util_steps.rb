Given(/^sample data is loaded$/) do
  require './db/seeds'
  extend SeedData
end

When(/^I click on "([^"]*)"$/) do |text|
  has_content?("syzygy")
  click_on text
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |css_selector, text|
  fill_in css_selector, with: text
end
