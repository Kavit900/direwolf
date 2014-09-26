class DropUnusedIds < ActiveRecord::Migration
  def change
      remove_column :fields, :fieldsId, Integer
      remove_column :jobs, :jobId, Integer
      remove_column :tags, :tagId, Integer
      remove_column :users, :userId, Integer
  end
end
