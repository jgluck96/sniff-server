class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :confirmation
      t.integer :user_id
      t.string :soaps
      t.float :total

      t.timestamps
    end
  end
end
