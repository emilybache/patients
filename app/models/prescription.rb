class Prescription < ActiveRecord::Base
  belongs_to :patient

  validates_inclusion_of :days_supply, :in => 1..90, :message => "must be between 1 and 90 days"

end
