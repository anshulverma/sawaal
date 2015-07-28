# encoding: utf-8

module Sawaal
  # Constants for TTY and methods to read and write to terminal
  #
  # @api private
  module TTY
    class << self
      def ansii_escape(sequence)
        "\033[#{sequence}"
      end

      ORIGINAL_PRINT = method(:print)

      def print(str)
        ORIGINAL_PRINT.call str
      end

      def println(str)
        puts str
      end
    end

    HIDE_CURSOR = ansii_escape('?25l')
    SHOW_CURSOR = ansii_escape('?25h')

    MOVE_UP = ansii_escape('A')
    MOVE_DOWN = ansii_escape('B')
    BEGINNING_OF_LINE = ansii_escape('1G')

    CLEAR_LINE = ansii_escape('K')
    SAVE_POSITION = ansii_escape('s')
    RESTORE_POSITION = ansii_escape('u')

    RETURN = "\r"
    CONTROL_C = '\\u0003'

    ARROW = '‣'
  end
end
