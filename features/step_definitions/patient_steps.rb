Given /^there is a patient "([^"]*)"( with (\d+) prescriptions)?$/ do |name, has_count, count|
  patient = Patient.create!(:name => name)
  if has_count
    count.to_i.times do 
      Factory.create(:prescription, :patient => patient)
    end
  end
end