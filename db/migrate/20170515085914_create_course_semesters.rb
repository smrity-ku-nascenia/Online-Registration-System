class CreateCourseSemesters < ActiveRecord::Migration[5.0]
  def change
    create_table :course_semesters do |t|
      t.references :semester, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
