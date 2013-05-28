## Bcx

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
client = Bcx::Client.new(:http, login: 'username', password: 'secret')
```

#### OAuth

```ruby
client = Bcx::Client.new(:oauth, client_id: '1234567890', client_secret: '831994c4170', access_token: 'b02ff9345c3')
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

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Write your tests and check everything passes
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request (into the development branch)
