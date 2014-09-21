class Createjobstagsjointable < ActiveRecord::Migration
  def change
    create_table :jobs_tags, :id => false do |t|
      t.integer :jobId
      t.integer :tagId
    end

    add_index :jobs_tags, [:jobId, :tagId]
  end
end
