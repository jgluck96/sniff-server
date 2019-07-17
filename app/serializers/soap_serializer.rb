class SoapSerializer < ActiveModel::Serializer
  attributes :id, :base, :fragrance1, :fragrance2, :fragrance3, :addon, :price, :user_id
  belongs_to :user
end
