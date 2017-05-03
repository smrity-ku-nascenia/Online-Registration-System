class CreateGlobalSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :global_settings do |t|
      t.integer :semester_id

      t.timestamps
    end
  end
end
