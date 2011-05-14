require 'spec_helper'

describe Patient do
  before(:each) do
    @attr = { :name => "Bob" }
  end

  it "should create a new instance given valid attributes" do
    Patient.create!(@attr)
  end

  it "should require a name" do
    no_name_patient = Patient.new({ :name => "" })
    no_name_patient.should_not be_valid
  end

  describe "#medicines_taken" do
    before do
      @patient = Patient.new(:name => "Bob")
    end

    it "should return the names of all the medicines the patient has taken" do
      @patient.prescriptions = [Prescription.new(:patient => @patient, :medicine_name => "Aspirin")]
      @patient.medicines_taken.should == ["Aspirin"]
    end
    it "removes duplicates" do
      @patient.prescriptions = [Prescription.new(:patient => @patient, :medicine_name => "Aspirin"),
                                Prescription.new(:patient => @patient, :medicine_name => "Aspirin")]
      @patient.medicines_taken.should == ["Aspirin"]
    end
  end

  describe "#days_taken" do
    before do
      @patient = Patient.new(:name => "Bob")
      p1 = Factory.create(:prescription, :medicine_name => "Aspirin", :dispense_date => Date.today - 15, :days_supply => 10)
      p2 = Factory.create(:prescription, :medicine_name => "Aspirin", :dispense_date => Date.today - 45, :days_supply => 7)
      @patient.prescriptions = [p1, p2]
    end

    it "should return all the days the medicine was taken" do
      @patient.days_taken("Aspirin", 90).length.should == 17
    end

    it "should only include days within days_back days ago" do
      @patient.days_taken("Aspirin", 20).length.should == 10
    end
  end
end
