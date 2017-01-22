
# REGISTER

When(/^I navigate to "([^"]*)"$/) do |path|
  visit(path)
end

Then(/^I should see the "([^"]*)" input form$/) do |label|
  expect(page.body).to match(label)
end

Then(/^I should be required to fill in "([^"]*)" with a "([^"]*)" when registering$/) do |css_selector, attribute|
  fill_in css_selector, with: ""
  click_on "SUBMIT"
  expect(page.body).to match("#{attribute} can't be blank")
end

Then(/^I should need to be at least 18 years old to register for the service$/) do
  fill_in "customer[date_of_birth]", with: "#{Date.today - (18.years - 1.day)}"
  click_on "SUBMIT"
  expect(page.body).to match("Date of birth - You must be at least 18 years old to use this service")
end

# UPDATE

When(/^I enter a new date of birth into the Date of Birth field$/) do
  fill_in "customer[date_of_birth]", with: "#{Date.today - (18.years + 1.day)}"
end

When(/^I enter current password into the current password field$/) do
  customer = Customer.find_by(email: "singleman@test.com")
  fill_in "customer_current_password", with: "123456"
end

Then(/^the current user's date of birth should be updated$/) do
  customer = Customer.find_by(email: "singleman@test.com")
  expect((customer.date_of_birth).to_s).to eq("#{(Date.today - (18.years + 1.day))}")
end
