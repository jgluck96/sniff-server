class AddColumnToSoaps < ActiveRecord::Migration[5.2]
  def change
    add_column :soaps, :order_id, :integer

  end
end
