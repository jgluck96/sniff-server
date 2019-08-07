class UserSerializer < ActiveModel::Serializer
  attributes :id, :guest, :created_at, :first_name, :last_name, :feedback, :email, :mobile, :address
  has_many :orders
  has_one :cart, include: :soaps

  # def soaps
end
