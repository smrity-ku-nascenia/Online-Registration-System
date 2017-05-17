class CreateRegistrationInformations < ActiveRecord::Migration[5.0]
  def change
    create_table :registration_informations do |t|
      t.references :enrollment, foreign_key: true
      t.references :course_semester, foreign_key: true
      t.float :mark
      t.string :grade
      t.float :gpa

      t.timestamps
    end
  end
end
