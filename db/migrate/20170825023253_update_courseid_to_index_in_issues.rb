class UpdateCourseidToIndexInIssues < ActiveRecord::Migration[5.0]
  def change
  	change_column :course, :courseid, :string
  	change_column :course, :length, :string
  end
end
