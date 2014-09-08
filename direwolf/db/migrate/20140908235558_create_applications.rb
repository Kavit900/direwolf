class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :coverletter
      t.int :status
      t.timestamp :dateOfApp
      t.int :jobId
      t.int :userId

      t.timestamps
    end
  end
end
