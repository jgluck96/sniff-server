class AddImgToSoap < ActiveRecord::Migration[5.2]
  def change
    add_column :soaps, :image, :string
  end
end
