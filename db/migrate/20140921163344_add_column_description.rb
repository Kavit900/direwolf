class AddColumnDescription < ActiveRecord::Migration
  def change
    add_column :jobs, :description, :text
  end
end
