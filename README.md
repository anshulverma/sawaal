# sawaal [![Version](http://img.shields.io/gem/v/sawaal.svg?style=flat-square)](https://rubygems.org/gems/sawaal)

[![Build](http://img.shields.io/travis-ci/anshulverma/sawaal.svg?style=flat-square)](https://travis-ci.org/anshulverma/sawaal)
[![Coverage](http://img.shields.io/codeclimate/coverage/github/anshulverma/sawaal.svg?style=flat-square)](https://codeclimate.com/github/anshulverma/sawaal)
[![Quality](http://img.shields.io/codeclimate/github/anshulverma/sawaal.svg?style=flat-square)](https://codeclimate.com/github/anshulverma/sawaal)
[![Inline docs](http://inch-ci.org/github/anshulverma/sawaal.svg?style=flat-square)](http://inch-ci.org/github/anshulverma/sawaal)
[![Downloads](http://img.shields.io/gem/dt/sawaal.svg?style=flat-square)](https://rubygems.org/gems/sawaal)

# Quickstart

Here is an example usage of this gem. This should be enough to get
started with `sawaal`.

``` ruby
require 'sawaal'

selected = Sawaal::Selector.choose(
    'which key is the best?', {
      :key1 => 'key1 is the best',
      :key2 => 'key2 is the best for sure',
      :key3 => 'key3 might be the one',
      :key4 => 'key4 is surely the best',
      :key5 => 'key5'
    })

puts selected
```

The only thing to remember is that in the choose call, you can use
either a hash of options or an array. If you used an array, the return
selected value will be the 0-based index of the selected item.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sawaal'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sawaal

## Contributing

1. Fork it ( https://github.com/[my-github-username]/sawaal/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

