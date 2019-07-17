class AddFeedbackToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :feeback, :string
  end
end
