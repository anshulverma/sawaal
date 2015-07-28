# encoding: utf-8

require 'spec_helper'

require 'spec_util'

require 'sawaal/selector'

describe Sawaal::Selector do
  it 'allows use of arrow keys to select' do
    with_input_output([
      Sawaal::TTY::MOVE_UP,
      Sawaal::TTY::MOVE_DOWN,
      Sawaal::TTY::MOVE_DOWN,
      Sawaal::TTY::MOVE_DOWN,
      Sawaal::TTY::RETURN
    ]) do
      selected = Sawaal.select('which key is the best?',
                               key1: 'key1 is the best',
                               key2: 'key2 is the best',
                               key3: 'key3 is the best',
                               key4: 'key4 is the best')
      expect(selected).to(eq(:key3))
    end
  end

  it 'allows selection over an array' do
    with_input_output([
      Sawaal::TTY::MOVE_UP,
      Sawaal::TTY::MOVE_DOWN,
      Sawaal::TTY::MOVE_DOWN,
      Sawaal::TTY::MOVE_DOWN,
      Sawaal::TTY::RETURN
    ]) do
      selected = Sawaal.select('which key is the best?', [
        'key1 is the best',
        'key2 is the best',
        'key3 is the best',
        'key4 is the best'
      ])
      expect(selected).to(eq(2))
    end
  end

  it 'does not allow invalid values for selection' do
    with_input_output([
      Sawaal::TTY::MOVE_UP,
      Sawaal::TTY::MOVE_DOWN,
      Sawaal::TTY::MOVE_DOWN,
      Sawaal::TTY::MOVE_DOWN,
      Sawaal::TTY::RETURN
    ]) do
      expect { Sawaal.select('which key is the best?', Object.new) }.to(
        raise_error(StandardError, 'invalid option type for selection'))
    end
  end

  it 'allows use of C-c to exit' do
    def run_test
      with_input_output([
        Sawaal::TTY::MOVE_DOWN,
        Sawaal::TTY::CONTROL_C
      ]) do
        Sawaal.select('which key is the best?',
                      key1: 'key1 is the best',
                      key2: 'key2 is the best',
                      key3: 'key3 is the best',
                      key4: 'key4 is the best')
      end
    end
    expect { run_test }.to(raise_error(SystemExit))
  end
end
