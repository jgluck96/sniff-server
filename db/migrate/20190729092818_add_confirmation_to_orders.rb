class AddConfirmationToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :guestorders, :confirmation, :string
  end
end
