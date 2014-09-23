class ChangeDeadlineType < ActiveRecord::Migration
  def change
    change_column :jobs, :deadline, :date
  end
end
