class CreateApplies < ActiveRecord::Migration
  def change
    create_table :applies do |t|
      t.text :cover
      t.integer :job_id

      t.references :job
      t.timestamps
    end
  end
end
