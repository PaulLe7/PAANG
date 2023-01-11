# Simple PAANG (Phoenix, Absinthe, Apollo, NextJs, GraphQL) App

A simple app to update user info.

## Getting the server started
```
cd crud-be
mix setup
mix phx.server
```

Two users will be seeded (id: 1, id: 2). 
Feel free to add more through `localhost.com:4000/graphiql`.

## Getting the client started
```
cd crud-fe
yarn install
yarn dev
```

## Notable
Had to switch `reactStrictMode: true` to `false` because of an issue with the `useMutation` hook in `react: 18.2.0` which caused `loading` to always be `true` and prevented `error` and `data` from updating their values, keeping them `undefined`:
https://github.com/apollographql/apollo-client/issues/9602
