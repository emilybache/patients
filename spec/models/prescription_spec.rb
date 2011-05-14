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

  describe "#days_taken" do
    before do
      @prescription = Factory.create(:prescription, :patient => Factory.create(:patient))
      @prescription.days_supply = 1
    end
    it "should return the days the medicine was taken" do
      @prescription.dispense_date = Date.today - 10
      @prescription.days_taken(10).should == [Date.today - 10]
    end
    it "should not return days after today" do
      @prescription.dispense_date = Date.today - 1
      @prescription.days_supply = 10
      @prescription.days_taken(10).should == [Date.today - 1, Date.today]
    end
    it "should only include days within days_back days ago" do
      @prescription.dispense_date = Date.today - 10
      @prescription.days_taken(9).should == []
    end
  end
end
