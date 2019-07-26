class OrderSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :soaps, :total, :confirmation
  belongs_to :user
  # belongs_to :order
end
