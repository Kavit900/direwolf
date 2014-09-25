class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :jobId
      t.integer :employeeId
      t.integer :fieldId
      t.string :title
      t.timestamp :deadline
      t.boolean :isDeleted

      t.timestamps
    end
  end
end
