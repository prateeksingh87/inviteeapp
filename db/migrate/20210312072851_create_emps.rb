class CreateEmps < ActiveRecord::Migration[6.1]
  def change
    create_table :emps do |t|
      t.string :fname
      t.string :lname
      t.string :address
      t.date :dob
      t.string :image

      t.timestamps
    end
  end
end
