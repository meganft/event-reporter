require 'pry'
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/manager'

class ManagerTest < Minitest::Test

  def test_manager_class_exists
    manager = Manager.new
    assert_instance_of Manager, manager
  end

  def test_clean_data_loads_as_hash
    manager = Manager.new
    assert_instance_of Hash, manager.load
  end

  def test_clean_returns_a_hash_of_cleaned_data
    manager = Manager.new

    expected = {1 => {"first_name"=>"Allison", "last_name"=>"Nguyen",  "email_address"=>"arannon@jumpstartlab.com", "homephone"=>"6154385000","street"=>"3155 19th St NW", "city"=>"Washington", "state"=>"DC", "zipcode"=>"20010"}}
     assert_equal expected, manager.load("full_event_attendees_dirty.csv")
   end

   def test_count_returns_number_of_members_in_queue
    manager = Manager.new
    manager.load
    assert_equal 0, manager.queue.count

    manager.find("first_name", "John")
    assert_equal 63, manager.queue.count
  end

  def test_clear_will_clear_queue
   manager = Manager.new

   manager.load
   assert_equal 0, manager.queue.count

   manager.find("first_name", "John")

   assert_equal 63, manager.queue.count

   manager.clear
   assert_equal 0, manager.queue.count
 end

 def test_manager_can_search_multiple_parameters
    manager = Manager.new

    manager.load
    assert_equal 0, manager.queue.count

    manager.find("first_name", "John")

    assert_equal 63, manager.queue.count

    manager.find("first_name", "Mary")

    assert_equal 16, manager.queue.count
  end

  def test_manager_empty_does_not_raise_error
     manager = Manager.new

     manager.load
     assert_equal 0, manager.queue.count

     manager.find("last_name", "Johnson")

     assert_equal 15, manager.queue.count

     assert_equal [], manager.queue.clear

   end



end
