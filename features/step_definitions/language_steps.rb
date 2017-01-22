When(/^I check "([^"]*)" and "([^"]*)" from the languages checkboxes$/) do |check1, check2|
  check(check1)
  check(check2)
end

Then(/^"([^"]*)" and "([^"]*)" should be checked$/) do |check1, check2|
  has_checked_field?(check1)
  has_checked_field?(check2)
end

Then(/^the customer, with email "([^"]*)", should have languages set to "([^"]*)" and "([^"]*)"$/) do |email, value1, value2|
  customer = Customer.find_by(email: email)
  expect(customer.languages.first.name).to eq(value1)
  expect(customer.languages.second.name).to eq(value2)
end
