require_relative 'test_helper'
require './lib/repl'

class ReplTest < Minitest::Test

  def test_repl_class_exists
    repl = Repl.new

    assert_equal Repl, repl.class
  end

end
