# encoding: utf-8

module Sawaal
  # Handle option selection
  #
  # @api private
  class Selections
    include Color

    def initialize(cursor, options)
      @cursor = cursor
      @keys, @items = build_items(options)
    end

    def select
      loop do
        ch = read_char

        # hide help after any keypress
        @cursor.hide_help

        # selection has been made
        break if ch == TTY::RETURN

        # move selection
        handle_input(ch)
      end

      selected = @cursor.current_line_index
      @cursor.write_selection(@items[selected])
      @keys[@cursor.current_line_index]
    end

    def handle_input(ch)
      case ch
      when TTY::MOVE_UP
        @cursor.highlight(@cursor.current_line_index - 1)
      when TTY::MOVE_DOWN
        @cursor.highlight(@cursor.current_line_index + 1)
      when TTY::CONTROL_C
        @cursor.write_selection(red('<terminated>'))
        exit 33
      end
    end

    def write
      @items.each do |item|
        @cursor.write_item(item)
      end
      @cursor.highlight(0)
    end

    private

    # Reads keypresses from the user including 2 and 3 escape character sequences.
    def read_char
      input = $stdin.getch
      return input unless input == "\e"
      begin
        Timeout.timeout(0.01) do
          input += $stdin.getch
          input += $stdin.getch
        end
      rescue Timeout::Error
        # ignored
      end
      input
    end

    def build_items(options)
      if options.is_a?(Hash)
        return options.keys, options.values
      elsif options.is_a?(Array)
        return Array(0..(options.length - 1)), options
      else
        fail(StandardError, 'invalid option type for selection')
      end
    end
  end
end
