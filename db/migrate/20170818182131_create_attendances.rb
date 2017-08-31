class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.string :entity_type
      t.integer :entity_id
      t.boolean :status
      t.date :for

      t.timestamps null: false
    end
  end
end
