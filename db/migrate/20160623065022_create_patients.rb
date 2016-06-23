class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.datetime :birthday
      t.text :address

      t.timestamps null: false
    end
  end
end
