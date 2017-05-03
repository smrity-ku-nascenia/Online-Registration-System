class CreateRegistrationInformations < ActiveRecord::Migration[5.0]
  def change
    create_table :registration_informations do |t|
      t.integer :student_id
      t.integer :semester_id
      t.integer :course_id
      t.float :mark
      t.string :grade
      t.float :gpa
      t.float :cgpa

      t.timestamps
    end
  end
end
