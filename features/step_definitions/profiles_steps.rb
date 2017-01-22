And(/^I am logged in as "([^"]*)"$/) do |email|
  customer = Customer.find_by(email: email)
  log_on_as(customer)
end

When(/^I navigate to customers edit page as "([^"]*)"$/) do |email|
  customer = Customer.find_by(email: email)
  visit "/customers/#{customer.id}/edit"
end

Then(/^I should see Edit Profile$/) do
  expect(page).to have_content('Edit Profile')
end

When(/^I select "([^"]*)" from "([^"]*)"$/) do |value, css|
  select(value, :from => css)
end

Then(/^the customer, with email "([^"]*)", should have smoker value set to "([^"]*)"$/) do |email, value|
  customer = Customer.find_by(email: email)
  expect(customer.profile.smoker).to eq(value)
end

Then(/^the customer, with email "([^"]*)", should have drinker value set to "([^"]*)"$/) do |email, value|
  customer = Customer.find_by(email: email)
  expect(customer.profile.drinker).to eq(value)
end

Then(/^the customer, with email "([^"]*)", should have education value set to "([^"]*)"$/) do |email, value|
  customer = Customer.find_by(email: email)
  expect(customer.profile.level_of_education).to eq(value)
end

Then(/^the customer, with email "([^"]*)", should have biography value set to "([^"]*)"$/) do |email, value|
  customer = Customer.find_by(email: email)
  expect(customer.profile.biography).to eq(value)
end

Then(/^the customer, with email "([^"]*)", should have star sign value set to "([^"]*)"$/) do |email, value|
  customer = Customer.find_by(email: email)
  expect(customer.profile.star_sign).to eq(value)
end

Then(/^there should be "([^"]*)" in "([^"]*)"$/) do |value, css|
  expect(find_field(css).value).to eq(value)
end

Then(/^the customer, with email "([^"]*)", should have imperial value to equal "([^"]*)"$/) do |email, value|
  customer = Customer.find_by(email: email)
  expect(customer.profile.imperial).to eq(value.to_f)
end

Then(/^the customer, with email "([^"]*)", should have metric value to equal "([^"]*)"$/) do |email, value|
  customer = Customer.find_by(email: email)
  expect(customer.profile.metric).to eq(value.to_f)
end

When(/^a customer uploads an image to profile, file exists$/) do
  page.attach_file("customer_profile_attributes_avatars_attributes_0_avatar", Rails.root + 'public/uploads/avatar/avatar/1/wolf.jpg')
end

Then(/^the customer, with email "([^"]*)", should have occupation value set to "([^"]*)"$/) do |email, value|
  customer = Customer.find_by(email: email)
  expect(customer.profile.occupation).to eq(value)
end
