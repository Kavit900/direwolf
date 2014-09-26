class RenameCols < ActiveRecord::Migration
  def change
    rename_column :jobs_tags, :jobId, :job_id
    rename_column :jobs_tags, :tagId, :tag_id
    rename_column :jobs, :employeeId, :employee_id
    rename_column :jobs, :fieldId, :field_id
  end
end
