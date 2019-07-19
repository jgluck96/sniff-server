class CartSerializer < ActiveModel::Serializer
  attributes :id, :user_id
  has_many :soaps
  belongs_to :user
end
