
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