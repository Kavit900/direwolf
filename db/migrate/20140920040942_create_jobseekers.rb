class CreateJobseekers < ActiveRecord::Migration
  def change
    create_table :jobseekers do |t|
      t.string :search

      t.timestamps
    end
  end
end
