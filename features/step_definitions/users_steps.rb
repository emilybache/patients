Given /^there is a user with name "([^"]*)", email "([^"]*)" and password "([^"]*)"$/ do |name, email, password|
  User.create!(:name => name, :email => email, :password => password)
end

Given /^I am signed in as "([^"]*)"$/ do |name|
  user = Factory.create(:user, :name => name)
  steps %Q{
      When I go to the signin page
      And I fill in "#{user.email}" for "Email"
      And I fill in "#{user.password}" for "Password"
      And I press "Sign in"
    }
end
