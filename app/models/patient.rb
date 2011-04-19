class Patient < ActiveRecord::Base
  has_many :prescriptions

  validates_presence_of :name
end
