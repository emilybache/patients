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
end
