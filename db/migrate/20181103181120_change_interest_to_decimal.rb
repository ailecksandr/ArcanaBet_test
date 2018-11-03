class ChangeInterestToDecimal < ActiveRecord::Migration[5.2]
  def up
    change_column :stocks, :interest, :decimal, precision: 5, scale: 4
  end

  def down
    change_column :stocks, :interest, :float
  end
end
