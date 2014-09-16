class AddPasswordConfirmationCorrected < ActiveRecord::Migration
  def change
    remove_column :users, :password_confirmation, :string
    add_column :users, :password_digest, :string
  end
end
