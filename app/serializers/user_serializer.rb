class UserSerializer < ActiveModel::Serializer
  attributes :id, :guest, :first_name, :last_name, :feedback, :email, :password, :mobile, :address
  # has_many :soaps
  has_one :cart, include: :soaps

  # def soaps
end
