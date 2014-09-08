class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.int :id
      t.string :name

      t.timestamps
    end
  end
end
