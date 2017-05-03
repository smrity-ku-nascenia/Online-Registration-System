class CreateSemesters < ActiveRecord::Migration[5.0]
  def change
    create_table :semesters do |t|
      t.string :semester_id
      t.string :semester_name

      t.timestamps
    end
  end
end
