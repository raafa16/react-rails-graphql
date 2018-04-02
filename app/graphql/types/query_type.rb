Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :companies, types[CompanyType] do
    description "List all the companies"
    resolve ->(obj, args, ctx) {
      Company.all
    }
  end

  field :company, CompanyType do
    argument :id, !types.ID
    description 'Find a company'
    resolve ->(obj, args, ctx) {
      Company.find(args['id'])
    }
  end
end
