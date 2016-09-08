require_relative 'test_helper'
require './lib/repl'


class ReplTest < Minitest::Test

  def test_repl_class_exists
    repl = Repl.new

    assert_equal Repl, repl.class
  end

  def test_it_can_get_user_input_command
    repl = Repl.new
    repl.command
    input = "help"

    assert_equal input, repl.command
  end

  def test_it_can_execute_user_command
    skip
    repl = Repl.new
    assert_equal
  end

end
