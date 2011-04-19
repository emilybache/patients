class CreatePrescriptions < ActiveRecord::Migration
  def self.up
    create_table :prescriptions do |t|
      t.string :medicine_name
      t.date :dispense_date
      t.integer :days_supply
      t.integer :patient_id

      t.timestamps
    end
  end

  def self.down
    drop_table :prescriptions
  end
end
