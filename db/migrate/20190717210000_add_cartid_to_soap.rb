class AddCartidToSoap < ActiveRecord::Migration[5.2]
  def change
    add_column :soaps, :cart_id, :integer
  end
end
