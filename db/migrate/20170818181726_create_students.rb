class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.references :division, index: true, foreign_key: true
      t.string :gender
      t.string :parent_guardian_name

      t.timestamps null: false
    end
  end
end
