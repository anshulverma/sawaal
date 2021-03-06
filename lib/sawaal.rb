# encoding: utf-8

require 'io/console'
require 'timeout'

require_relative './sawaal/color'
require_relative './sawaal/cursor'
require_relative './sawaal/selections'
require_relative './sawaal/selector'
require_relative './sawaal/tty'
require_relative './sawaal/version'

# Helps a command line application by allowing it to ask
# multiple choice questions
module Sawaal
  class << self
    # Run the selection prompt with selectable options
    #
    # @example
    #   Sawaal.select('which key is the best?',
    #                key1: 'key1 is the best',
    #                key2: 'key2 is the best',
    #                key3: 'key3 is the best',
    #                key4: 'key4 is the best')
    #
    # @return [Symbol] Selected key
    def select(question, options)
      Sawaal::Selector.choose(question, options)
    end
  end
end
