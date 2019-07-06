class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.boolean :guest
      t.string :full_name
      t.string :email
      t.string :password_digest
      t.bigint :mobile
      t.string :address

      t.timestamps
    end
  end
end
