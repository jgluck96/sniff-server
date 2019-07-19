class AddQuantityToSoaps < ActiveRecord::Migration[5.2]
  def change
    add_column :soaps, :quantity, :bigint
  end
end
