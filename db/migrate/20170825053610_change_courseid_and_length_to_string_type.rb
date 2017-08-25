class ChangeCourseidAndLengthToStringType < ActiveRecord::Migration[5.0]
  def change
  	change_column :courses, :courseid, :string
  	change_column :courses, :length, :string
  end
end
