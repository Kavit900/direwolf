class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :userId
      t.string :role
      t.string :name
      t.string :password
      t.string :username
      t.string :email
      t.string :skills
      t.text :resume
      t.string :contactName
      t.string :phone

      t.timestamps
    end
  end
end
