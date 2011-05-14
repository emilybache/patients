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
end
