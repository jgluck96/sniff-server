class SoapSerializer < ActiveModel::Serializer
  attributes :id, :base, :image, :fragrance1, :cart_id, :quantity, :fragrance2, :fragrance3, :addon, :price
  belongs_to :cart
  # belongs_to :order
end
