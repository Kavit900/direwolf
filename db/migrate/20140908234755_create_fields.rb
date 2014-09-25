class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.integer :fieldId
      t.string :name

      t.timestamps
    end
  end
end
