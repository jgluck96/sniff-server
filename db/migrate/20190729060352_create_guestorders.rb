class CreateGuestorders < ActiveRecord::Migration[5.2]
  def change
    create_table :guestorders do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.bigint :phone
      t.string :street_address
      t.string :apt
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :soaps
      t.float :price

      t.timestamps
    end
  end
end
