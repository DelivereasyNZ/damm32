# Damm32

A ruby implementation of the Damm checksum algorithm for 32-character-long alphabets

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add damm32

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install damm32

## Usage

```
Damm32.checksum("abc")
=> "g"

Damm32.add_checksum("abc")
=> "abcg"

Damm32.valid?("abcg")
=> true

Damm32.valid?("abc0")
=> false
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/delivereasynz/damm32.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
