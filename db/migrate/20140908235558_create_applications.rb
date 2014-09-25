class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :coverLetter
      t.integer :status
      t.timestamp :dateOfApp
      t.integer :jobId
      t.integer :userId

      t.timestamps
    end
  end
end
