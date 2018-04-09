Types::CustomerType = GraphQL::ObjectType.define do
  name 'Customer'
  description 'A customer of a company'

  #Expose fields associated with Customer model

  field :id, !types.ID, 'ID of the customer'
  field :name, !types.String, 'Name of the customer'
  field :email, !types.String, 'Email of the customer'
  field :company, !Types::CompanyType, 'The customer\'s company ID',  resolve: ->(obj, _args, _ctx) { obj.company }
  field :address, !Types::AddressType, 'The customer\'s address',  resolve: ->(obj, _args, _ctx) { obj.address }
end