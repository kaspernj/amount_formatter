[![Build Status](https://api.shippable.com/projects/540e7b993479c5ea8f9ec1f8/badge?branchName=master)](https://app.shippable.com/projects/540e7b993479c5ea8f9ec1f8/builds/latest)
[![Code Climate](https://codeclimate.com/github/kaspernj/amount_formatter/badges/gpa.svg)](https://codeclimate.com/github/kaspernj/amount_formatter)
[![Test Coverage](https://codeclimate.com/github/kaspernj/amount_formatter/badges/coverage.svg)](https://codeclimate.com/github/kaspernj/amount_formatter)

# amount_formatter

This project is supposed to offer an alternative to ActiveSupport's number_to_currency-method, as it is fataly slow for some applications, that makes heavy use of it.

## Installation

Add to your Gemfile and bundle:
```ruby
gem "amount_formatter"
```

## Usage

Format amounts like this:
```ruby
AmountFormatter.format(1234.12, precision: 2) #=> 1,234.12
```

## I18n support

Add this to an initializer:
```ruby
AmountFormatter.locale_engine = :i18n
```

And then use AmountFormatter as normal.

## Contributing to amount_formatter
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2014 Kasper Johansen. See LICENSE.txt for
further details.

