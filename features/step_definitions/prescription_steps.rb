require 'date'

When /^(?:|I )fill in "([^"]*)" for "Dispense date" on the new prescription page$/ do |value|
  field_id = "prescription_dispense_date"
  year_field = field_id + '_1i'
  month_field = field_id + '_2i'
  day_field = field_id + '_3i'

  date = Date.parse(value)

  select(date.year.to_s, :from => year_field)
  select(date.strftime("%B"), :from => month_field)
  select(date.day.to_s, :from => day_field)
end

Given /^"([^"]*)" has a (\d+) day prescription for "([^"]*)" from (\d+) days ago$/ do |patient_name, days_supply, medicine_name, dispense_date_ago|
  patient = Patient.find_by_name(patient_name)
  dispense_date = Date.today() - dispense_date_ago.to_i
  Prescription.create(:patient => patient, :medicine_name => medicine_name, 
                          :days_supply => days_supply, :dispense_date => dispense_date)
end
