class RenameFeedbackColUser < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :feeback, :feedback
  end
end
