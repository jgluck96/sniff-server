class OrderSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :soaps, :total, :address, :confirmation
  belongs_to :user
  # belongs_to :order
end
