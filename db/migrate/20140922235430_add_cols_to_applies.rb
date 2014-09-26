class AddColsToApplies < ActiveRecord::Migration
  def change
    add_column :applies, :user_id, :integer
    add_column :applies, :status, :integer
    add_column :applies, :dateOfApp, :timestamp
  end
end
