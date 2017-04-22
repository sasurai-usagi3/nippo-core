# NippoCore
This is a daily report system gem for Rails application.  
Mount this system to yours, you can use daily report sharing system.

## Usage

## Installation
Add this line to your application's Gemfile:

```ruby:Gemfile
gem 'nippo_core'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install nippo_core
```

Then, mount to main system. In `config/routes.rb`
```ruby:config/routes.rb
  # change path where you want to mount
  mount NippoCore::Engine => '/mount_point'
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
