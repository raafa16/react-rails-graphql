Types::AddressType = GraphQL::ObjectType.define do
  name 'Address'
  description 'An address of a customer'

  #Expose fields associated with Address model

  field :id, !types.ID, 'ID of the address'
  field :city, !types.String, 'City'
  field :street, !types.String, 'Street'
  field :zip_code, !types.String, 'Zip Code'
end