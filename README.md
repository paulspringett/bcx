## Bcx

> NB. This gem has a lot of the main Basecamp endpoints. Please add others by [contributing!](#contributing)

Fully-fledged Ruby API wrapper for Basecamp Next

```
      ___________________ ____  ___
      \______   \_   ___ \\   \/  /
       |    |  _/    \  \/ \     /
       |    |   \     \____/     \
       |______  /\______  /___/\  \
              \/        \/      \_/
```

[![Build Status](https://travis-ci.org/paulspringett/bcx.png?branch=master)](https://travis-ci.org/paulspringett/bcx)

### Installation

```shell
$ gem install bcx
```

Or if you are using Bundler, add

```ruby
gem 'bcx'
```

to your `Gemfile` and run

```bash
$ bundle install
```

### Usage

Configure Bcx for your Basecamp account

```ruby
Bcx.configure do |config|
  config.account = '1234567890'
end
```

### Launchpad API client

Before connecting to the Basecamp API you can optionally use this client to obtain a list of a user's available accounts and products. They may be a mix of Basecamp Next, Basecamp Classic, Campfire & other products.

From 37signal's API docs:

> This endpoint should be first request made after you've obtained a user's authorization token via OAuth. You can pick which account to use for a given product, and then base where to make requests to from the chosen account's href field.

```ruby
launchpad = Bcx::Launchpad::OAuth.new(client_id: '1234567890', client_secret: '831994c4170', access_token: 'b02ff9345c3')
authorization = launchpad.authorization!

authorization.identity.name
# => "Joe Bloggs"

authorization.accounts
# => [...]
```

See [these docs](https://github.com/37signals/api/blob/master/sections/authentication.md#get-authorization) for more details.

### Basecamp clients

You can connect to the Basecamp API using the Bcx client. The client provides authentication over HTTP or OAuth.

#### HTTP Basic Auth

```ruby
client = Bcx::Client::HTTP.new(login: 'username', password: 'secret')
```

#### OAuth

```ruby
client = Bcx::Client::OAuth.new(client_id: '1234567890', client_secret: '831994c4170', access_token: 'b02ff9345c3')
```

You can get a `client_id` and `client_secret` from https://integrate.37signals.com/

You can also pass an `:account` option to the OAuth client (allowing multiple clients in your app).

```ruby
client = Bcx::Client::OAuth.new(account: 99999999, ...)
```

### Resources

The following resources are fully implemented and tested.

* [People](http://paulspringett.github.io/bcx/docs/person.html)
* [Projects](http://paulspringett.github.io/bcx/docs/project.html)
* [Todolists](http://paulspringett.github.io/bcx/docs/todolist.html)
* [Todos](http://paulspringett.github.io/bcx/docs/todo.html)
* [Accesses](http://paulspringett.github.io/bcx/docs/access.html)
* [Authorization](http://paulspringett.github.io/bcx/docs/authorization.html) (Launchpad API)


#### Bang operators

It's important to understand the use of bang methods when using Bcx. Each resource can be called with or without a `!`.

**Without the bang** you can chain and build endpoint calls:

```ruby
client.projects(123).todolists
# => #<Bcx::Resources::Todolist ...>

client.projects(123).todolists.url
# => "projects/123/todolists"
```

**With the bang** you can hit the API endpoint over the network and fetch data:

```ruby
client.projects(123).todolists!
# => [#<Hashie::Mash id=456 ...>, #<Hashie::Mash id=789 ...>]
```

### Error handling

If the response whilst fetching a resource is a 4xx or 5xx, Bcx will raise a `Bcx::ResponseError` exception.

```ruby
client.projects.create!(name: '')
# => Bcx::ResponseError: 422 POST https://basecamp.com/2274488/api/v1/projects.json | Errors: name can't be blank
```

You can rescue this exception to grab the status, method, URL and errors individually.

```ruby
begin
  client.projects.create!(name: '')
rescue Bcx::ResponseError => response
  response.method # => "POST"
  response.status # => 422
  response.url # => "https://basecamp.com/2274488/api/v1/projects.json"
  response.errors # => ["name can't be blank"]
end
```

### Documentation

See the full [annotated source code](http://paulspringett.github.io/bcx/docs/bcx.html).

The docs are generated using [Docco](http://jashkenas.github.io/docco/). To generate the docs, run:

```bash
$ npm install -g docco
$ rake docs:generate
```

### Contributing

The endpoints listed under [Resources](https://github.com/paulspringett/bcx#resources) above are implemented and tested.

All other endpoints still need implementing, see the official
[Basecamp Next API docs](https://github.com/37signals/bcx-api) for details on what to implement.

### How to contribute

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Write your tests and check everything passes
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request (into the master branch)
