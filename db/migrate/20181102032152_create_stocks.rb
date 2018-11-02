class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :name
      t.float :unit_price
      t.float :interest
      t.integer :duration

      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
