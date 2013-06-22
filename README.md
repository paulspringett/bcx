## Bcx

> NB. This is still alpha software and may not work as expected. It's also missing a lot of the Basecamp endpoints. Please feel free [to contribute!](#contributing)

Fully-fledged Ruby API wrapper for Basecamp Next

```
      ___________________ ____  ___
      \______   \_   ___ \\   \/  /
       |    |  _/    \  \/ \     /
       |    |   \     \____/     \
       |______  /\______  /___/\  \
              \/        \/      \_/
```

### Installation

```shell
$ gem install bcx
```

Or if you are using Bundler

```ruby
gem 'bcx'
```

### Usage

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

### Resources

See the [full resource documentation](#todo) for all available API endpoints.

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

See the full [annotated source code](http://paulspringett.github.io/docs/bcx.html).

The docs are generated using [Docco](http://jashkenas.github.io/docco/). To generate the docs, run:

```bash
$ git checkout master
$ npm install -g docco
$ docco lib/**/*.rb
$ git commit -am "Updated docs"

$ git checkout gh-pages
$ git checkout master -- docs/ # Copy docs changes across and stage
$ git commit -m "Updated docs on gh-pages"
```

### Contributing

The following endpoints are implemented and tested:

* People
* Projects
* Todolists
* Todos

All other endpoints still need implementing, see the official
[Basecamp Next API docs](https://github.com/37signals/bcx-api) for details on what to implement.

### How to contribute

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Write your tests and check everything passes
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request (into the master branch)
