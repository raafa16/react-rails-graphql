# React Rails Relay GraphQl Demo application

* Ruby version: 2.5.0
* Rails version: 5.1.6
* Postgresql: 9.6 or above (Project done using v10.3)

# Steps to explore project
With the above prerequisites filled, just clone this GitHub repo and then run the usual bin/rails s to start the rails server. 
Run:
```apple js
rake db:seed
```
Then, you can start playing with the GraphiQL interactive API exploring console by navigating to http://localhost:3000/graphiql.

# Sample Graphql Query
Run the following query to see magic happen:
```apple js
{
  companies {
    id
    name
    customers {
      name
      company {
        name
      }
      address {
      	city
      }
    }
  }
}
```

## Project Setup

#### 1) Setup new rails project:

```apple js
rails new app_name -d postgresql --webpack
```

### 2) Install GraphQL gem and GraqphiQL
Add the following to the Gemfile: ``` gem 'graphql```

Next run ```bundle install``` and then run ```bin/rails g graphql:install```. 
This second step installs a ```graphiql-rails``` gem at the bottom of the Gemfile. 
Recommended to move this gem into the existing ```:development``` group.
Then run ```bunlde install``` again.

### 3) Install React and Relay
First, install React using webpacker: ```bin/rails webpacker:install:react```

Then add relay: ```yarn add react-relay relay-runtime```

And then add the development dependencies: ```yarn add --dev babel-plugin-relay relay-compiler```
 
Next, edit ```.babelrc``` and find the 'plugins' section. At the top of that, add: ```"relay"```
 
Lastly, edit ```package.json``` and add the following:

```apple js
"scripts": {
  "relay": "relay-compiler --src ./app/javascript/packs --schema ./config/schema.graphql --extensions js jsx"
}
```
This is an alternative to typing ```yarn run relay``` to generate the graphql query code and will save us a lot of time.

### 4) Create GraphQL query types
Create the GraphQL query types for companies, customers and addresses. 

Add a field type for every Query Type so that it can be queried (see ```app/graphql/types/query_type.rb```).

Next, open the Rails console and run: ```File.open('config/schema.graphql', 'wb') {|f| f.write GraphQL::Schema::Printer.print_schema(GraphRelayReactTestSchema)}```

### 5) Make GraphQL query from graphiql
Browse to ```http://localhost:3000/graphiql``` and run some queries to test that everything is fine.

### 6) Make few automation
Make the ```yarn run relay``` command run in the background to automatically compile the GraphQL queries in .jsx files.
This was done by including a ```spawn``` command in ```config/environemnts/development.rb``` file so that ```yarn run relay --watch``` is run when Rails is run in development mode.

### 7) Add React Code in Rails template
Add a home controller, route and view that uses ```javascript_pack_tag``` to load the ```hello_react``` React javascript file.

## ToDO
* Create React component and to load data from Graphql API.
* Study Relay to hold state of each react component.
* Study graphql mutation to create/edit companies, customers and addresses.
