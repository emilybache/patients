require 'date'

# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                  "Emily Bache"
  user.email                 "emily@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.define :patient do |patient|
  patient.name  "Bob"
end

Factory.define :prescription do |prescription|
  prescription.medicine_name   "Aspirin"
  prescription.dispense_date   Date.today() - 35
  prescription.days_supply     30
end
