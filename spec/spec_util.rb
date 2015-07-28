# encoding: utf-8

require 'tempfile'

def with_input_output(input, &block)
  allow(STDIN).to(receive(:getc).and_return(*input))
  allow(Sawaal::TTY).to(receive(:print))
  allow(Sawaal::TTY).to(receive(:println))
  block.call
end
