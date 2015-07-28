# encoding: utf-8

module Sawaal
  # Methods to colorize output
  #
  # @api private
  module Color
    # Colorize a string with red color
    #
    # @return [String]
    def red(str)
      colorize(str, 31)
    end

    # Colorize a string with green color
    #
    # @return [String]
    def green(str)
      colorize(str, 32)
    end

    # Colorize a string with cyan color
    #
    # @return [String]
    def cyan(str)
      colorize(str, 36)
    end

    # Returns the bold representation
    #
    # @return [String]
    def bold(str)
      colorize(str, 1, 22)
    end

    private

    # Wrap a string in a specific color code
    #
    # @return [String]
    def colorize(str, color_code, end_tag = 0)
      "\033[#{color_code}m#{str}\033[#{end_tag}m"
    end
  end
end
