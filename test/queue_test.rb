gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/queue'

class QueueTest < Minitest::Test

  #examples with dirty data file?
  def test_it_prints_lines_from_print_command
    q = Queue.new
    # manager.load
    # manager.find("first_name", "John")

    assert_equal 5, q.print.length
  end




end
