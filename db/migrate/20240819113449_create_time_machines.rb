class CreateTimeMachines < ActiveRecord::Migration[7.1]
  def change
    create_table :time_machines do |t|
      t.string :name
      t.integer :size
      t.string :comfort
      t.integer :speed
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
