class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :user_id
      t.string :address
      t.string :full_name

      t.timestamps null: false
    end
  end
end
