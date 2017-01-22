When(/^I check "([^"]*)" and "([^"]*)" from the ethnicities checkboxes$/) do |check1, check2|
  check(check1)
  check(check2)
end

Then(/^the customer, with email "([^"]*)", should have ethnicities set to "([^"]*)" and "([^"]*)"$/) do |email, value1, value2|
  customer = Customer.find_by(email: email)
  expect(customer.ethnicities.first.name).to eq(value1)
  expect(customer.ethnicities.second.name).to eq(value2)
end
