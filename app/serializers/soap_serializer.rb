class SoapSerializer < ActiveModel::Serializer
  attributes :id, :base, :fragrance1, :quantity, :fragrance2, :fragrance3, :addon, :price
  belongs_to :cart
  # belongs_to :order
end
