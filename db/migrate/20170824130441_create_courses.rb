class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.integer :courseid
      t.string :semester
      t.string :instructor
      t.string :point
      t.string :session
      t.string :place
      t.string :language
      t.string :asgeneral
      t.string :generalclass
      t.string :department
      t.integer :length
      t.string :choose
      t.string :coregeneral
      t.string :agenda
      t.string :name
      t.string :change
      t.string :note

      t.timestamps
    end
  end
end
