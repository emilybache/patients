require 'spec_helper'
require 'date'

describe Prescription do
  before(:each) do
    @attr = { :medicine_name => "Aspirin2", :dispense_date => Date.today(), :days_supply => 30 }
  end

  it "should create a new instance given valid attributes" do
    Prescription.create!(@attr)
  end

  it "should require a medicine name" do
    no_name_prescription = Prescription.new(@attr.merge(:medicine_name => ""))
    no_name_prescription.should_not be_valid
  end
  
  it "should not have too many days supply" do
    p = Prescription.new(@attr.merge(:days_supply => 91))
    p.should_not be_valid
  end
end
