# == Schema Information
# Schema version: 20110503114457
#
# Table name: prescriptions
#
#  id            :integer         not null, primary key
#  medicine_name :string(255)
#  dispense_date :date
#  days_supply   :integer
#  patient_id    :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Prescription < ActiveRecord::Base
  belongs_to :patient

  validates_inclusion_of :days_supply, :in => 1..90, :message => "must be between 1 and 90 days"
  validates_presence_of :medicine_name

  def days_taken(days_back)
    (0...days_supply).map do |day|
      day_taken = dispense_date + day
      (day_taken <= Date.today && day_taken >= Date.today - days_back) ? day_taken : nil
    end.compact
  end
end
