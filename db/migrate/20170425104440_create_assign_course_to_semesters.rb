class CreateAssignCourseToSemesters < ActiveRecord::Migration[5.0]
  def change
    create_table :assign_course_to_semesters do |t|
      t.integer :semester_id
      t.integer :course_id

      t.timestamps
    end
  end
end
