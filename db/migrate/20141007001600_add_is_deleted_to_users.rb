class AddIsDeletedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :isDeleted, :boolean, default: false
  end
end
