# encoding: utf-8

module Sawaal
  # Handle cursor movements and text highlighting
  #
  # @api private
  class Cursor
    include Color

    attr_accessor :current_line_index

    def initialize
      @text = []
      @current_line_index = -1
      @help_hidden = false
    end

    def save_excursion(&block)
      hide
      begin
        return block.call
      ensure
        show
      end
    end

    def hide
      TTY.print TTY::HIDE_CURSOR
    end

    def show
      TTY.print TTY::SHOW_CURSOR
    end

    def move_up
      TTY.print TTY::MOVE_UP
    end

    def move_down
      TTY.print TTY::MOVE_DOWN
    end

    def write_question(question)
      TTY.print "#{green('?')} #{bold(question)} "
      save_position
      TTY.print '(use arrow keys, press <enter> when finished)'
    end

    def hide_help
      return if @help_hidden
      restore_position
      clear_line
      move_down
      move_to_beginning
      @help_hidden = true
    end

    def write_item(item)
      line = "#{bold TTY::ARROW} #{item}"
      move_down
      move_to_beginning
      TTY.print line
      @text.push(line)
      @current_line_index += 1
    end

    def write_selection(item)
      move_to(@text.length)
      move_to_beginning
      @text.length.times do
        move_up
        clear_line
      end

      restore_position
      clear_line
      TTY.println cyan(item)
    end

    def highlight(index)
      index %= @text.length
      unhighlight
      move_to(index)
      @current_line_index = index

      move_to_beginning
      clear_line
      TTY.print cyan(@text[@current_line_index])
    end

    private

    def unhighlight
      move_to_beginning
      clear_line
      TTY.print @text[@current_line_index]
    end

    def move_to_beginning
      TTY.print TTY::BEGINNING_OF_LINE
    end

    def move_to(index)
      if index < @current_line_index
        (@current_line_index - index).times { move_up }
      else
        (index - @current_line_index).times { move_down }
      end
    end

    def clear_line
      TTY.print TTY::CLEAR_LINE
    end

    def save_position
      TTY.print TTY::SAVE_POSITION
    end

    def restore_position
      TTY.print TTY::RESTORE_POSITION
    end
  end
end
