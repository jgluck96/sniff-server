class RemoveUseridFromSoap < ActiveRecord::Migration[5.2]
  def change
    remove_column :soaps, :user_id
  end
end
