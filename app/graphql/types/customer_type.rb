CustomerType = GraphQL.ObjectType.define do
  name 'Customer'
  description 'A customer of a company'

  #Expose fields associated with Customer model

  field :id, types.ID, 'ID of the customer'
  field :name, types.String, 'Name of the customer'
  field :email, types.String, 'Email of the customer'
  field :company_id, types.ID, 'The customer\'s company ID'
  field :address, AddressType
end