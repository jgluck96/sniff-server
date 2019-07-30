class AddFeedbackToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :guestorders, :feedback, :string

  end
end
