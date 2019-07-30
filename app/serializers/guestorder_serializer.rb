class GuestorderSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :confirmation, :last_name, :email, :phone, :street_address, :apt, :city, :state, :zipcode, :soaps, :price
end
