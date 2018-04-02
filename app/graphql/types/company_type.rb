CompanyType = GraphQL::ObjectType.define do
  name 'Company'
  description 'A company'

  #Expose fields associated with Company model

  field :id, types.ID, 'ID of the Company'
  field :name, types.String, 'Name of the Company'
  field :customers, types[CustomerType]
end