class CreateSoaps < ActiveRecord::Migration[5.2]
  def change
    create_table :soaps do |t|
      t.string :base
      t.string :fragrance1
      t.string :fragrance2
      t.string :fragrance3
      t.string :addon
      t.string :price
      t.integer :user_id

      t.timestamps
    end
  end
end
