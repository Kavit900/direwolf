class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.int :id
      t.int :employeeId
      t.int :fieldId
      t.string :title
      t.timestamp :deadline
      t.boolean :isDeleted

      t.timestamps
    end
  end
end
