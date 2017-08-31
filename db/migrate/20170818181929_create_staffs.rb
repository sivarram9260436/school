class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :gender
      t.references :division, index: true, foreign_key: true
      t.string :email_id
      t.string :password

      t.timestamps null: false
    end
  end
end
