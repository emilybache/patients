# == Schema Information
# Schema version: 20110503114457
#
# Table name: patients
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Patient < ActiveRecord::Base
  has_many :prescriptions

  validates_presence_of :name
  validates_uniqueness_of :name

  def medicines_taken()
    prescriptions.map(&:medicine_name).uniq
  end

  def days_taken(medicine_name, days_back)
    prescriptions.map do |prescription|
      prescription.medicine_name == medicine_name ? prescription.days_taken(days_back) : nil
    end.flatten.compact.uniq
  end

end
