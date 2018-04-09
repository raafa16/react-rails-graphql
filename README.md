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

## ToDO
* Hook up React and Relay to load display data from Graphql API.
