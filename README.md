# A devise-active backend for ActiveJob

Adds an `activejob` backend to [devise-async](https://github.com/mhfs/devise-async).

Note that did not I push (yet) a pull request to the original `devise-async` repository because right now
the `activejob` gem breaks compatiliby with older versions of Rails, due to explicit dependency to
`activesupport` 4.1.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'devise-async-activejob'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install devise-async-activejob

## Usage

To use the gem you just have to configure `devise-async` the use the `activejob` backend.
For exemple if you use an initializer:

```ruby
# config/initializers/devise_async.rb
Devise::Async.setup do |config|
  config.enabled = true
  config.backend = :active_job
  # ...
end
```

See the [docs for devise-async](https://github.com/mhfs/devise-async) for an exntensive documentation.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/devise-async-activejob/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
