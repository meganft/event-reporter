require_relative 'test_helper'
require './lib/manager'

class ManagerTest < Minitest::Test

  def test_manager_class_exists
    manager = Manager.new
    assert_instance_of Manager, manager
  end

  def test_clean_data_loads_as_hash
    manager = Manager.new
    assert_instance_of Hash, manager.load_file
  end

  def test_clean_returns_a_hash_of_cleaned_data
    manager = Manager.new

    expected = {1 => {"first_name"=>"Allison", "last_name"=>"Nguyen", "email_address"=>"arannon@jumpstartlab.com", "homephone"=>"6154385000", "street"=>"3155 19th St NW", "city"=>"Washington", "state"=>"DC", "zipcode"=>"20010"}}

     assert_equal expected, manager.load_file("full_event_attendees_dirty.csv")
   end

   def test_count_returns_zero_before_find_called
    manager = Manager.new
    manager.load_file("full_event_attendees_dirty.csv")

    assert_equal 0, manager.count
  end

  def test_clear_will_clear_queue
   manager = Manager.new

   manager.load_file
   assert_equal 0, manager.count

   manager.find("first_name", "John")

   manager.clear

  end

  def test_manager_empty_does_not_raise_error
     manager = Manager.new

     manager.load_file("full_event_attendees_dirty.csv")
     assert_equal 0, manager.count

     manager.find("last_name", "Johnson")

     assert_equal 0, manager.count

     assert_equal [], manager.clear
   end

end
