gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/queue'

class QueueTest < Minitest::Test

  def test_it_prints_lines_from_print_command
    q = Queue.new

    assert_instance_of Array, q.queue
  end

  def test_count_returns_number_of_members_in_queue
    q = Queue.new
      expected = [1 => { "first_name"=>"Allison", "last_name"=>"Nguyen",  "email_address"=>"arannon@jumpstartlab.com", "homephone"=>"6154385000","street"=>"3155 19th St NW", "city"=>"Washington", "state"=>"DC", "zipcode"=>"20010"}]

    assert_equal 0, q.count

    q.insert(expected)
    assert_equal 1, q.count
  end

  def test_queue_will_print
    q = Queue.new
    expected = {1 => { "first_name"=>"Allison", "last_name"=>"Nguyen",  "email_address"=>"arannon@jumpstartlab.com", "homephone"=>"6154385000","street"=>"3155 19th St NW", "city"=>"Washington", "state"=>"DC", "zipcode"=>"20010"}}

    assert_equal 0, q.count

    q.insert(expected)
    assert_equal "", q.print
  end

end
