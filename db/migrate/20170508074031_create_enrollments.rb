class CreateEnrollments < ActiveRecord::Migration[5.0]
  def change
    create_table :enrollments do |t|
      t.references :user, foreign_key: true
      t.references :semester, foreign_key: true
      t.string :status
      t.float :cgpa
      t.float :total_credit, :default=> 0.0

      t.timestamps
    end
  end
end
