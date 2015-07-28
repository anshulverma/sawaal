# encoding: utf-8

require 'io/console'

require 'sawaal/cursor'
require 'sawaal/selections'

module Sawaal
  # Way into invoking the selection
  #
  # @api private
  class Selector
    def self.choose(question, options)
      cursor = Cursor.new
      selections = Selections.new(cursor, options)

      cursor.save_excursion do
        cursor.write_question question
        selections.write
        selections.select
      end
    end
  end
end
