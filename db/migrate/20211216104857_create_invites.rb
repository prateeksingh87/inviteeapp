class CreateInvites < ActiveRecord::Migration[6.1]
  def change
    create_table :invites do |t|
      t.string :status
      t.string :address
      t.string :referal_code
      t.integer :user_id

      t.timestamps
    end
  end
end
