class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :search
      t.string :text_field_tag

      t.timestamps
    end
  end
end
