require_relative 'test_helper'
require './lib/container'

class ContainerTest < Minitest::Test

  #setup method  to not have to copy into every file, change names on reuired files


  def test_it_returns_queue_in_an_array
    q = Container.new

    assert_instance_of Array, q.queue
  end

  def test_count_returns_number_of_members_in_queue
    q = Container.new
      expected =  {"first_name"=>"Allison", "last_name"=>"Nguyen",  "email_address"=>"arannon@jumpstartlab.com", "homephone"=>"6154385000","street"=>"3155 19th St NW", "city"=>"Washington", "state"=>"DC", "zipcode"=>"20010"}

    assert_equal 0, q.count

    q.insert(expected)

    assert_equal 1, q.count
  end

  def test_queue_will_print
    q = Container.new
    expected =  {"first_name"=>"Allison", "last_name"=>"Nguyen",  "email_address"=>"arannon@jumpstartlab.com", "homephone"=>"6154385000","street"=>"3155 19th St NW", "city"=>"Washington", "state"=>"DC", "zipcode"=>"20010"}

    assert_equal 0, q.count

    q.insert(expected)
    assert_equal [{"first_name"=>"Allison", "last_name"=>"Nguyen",  "email_address"=>"arannon@jumpstartlab.com", "homephone"=>"6154385000","street"=>"3155 19th St NW", "city"=>"Washington", "state"=>"DC", "zipcode"=>"20010"}], q.queue_print
  end

  def test_it_will_print_by_certain_attribute
    q = Container.new
      expected = {"first_name"=>"Allison", "last_name"=>"Nguyen",  "email_address"=>"arannon@jumpstartlab.com", "homephone"=>"6154385000", "street"=>"3155 19th St NW", "city"=>"Washington", "state"=>"DC", "zipcode"=>"20010"}
      expected2 = {"first_name"=>"Sarah", "last_name"=>"Bankins",  "email_address"=>"pinalevitsky@jumpstartlab.com", "homephone"=>"4145205000","street"=>"2022 15th Street NW", "city"=>"Washington", "state"=>"DC", "zipcode"=>"20090"}

    q.insert(expected)
    q.insert(expected2)

    assert_equal "", q.print_by("last_name")
  end

  def test_it_will_populate_district_number_by_zipcode
    q = Container.new

    assert_equal 1, q.district_info("80210")
  end

  def test_queue_district_will_add_district_info_to_attendee
    # skip
    #tabke this test out?
    q = Container.new
    expected = {"first_name"=>"Allison", "last_name"=>"Nguyen",  "email_address"=>"arannon@jumpstartlab.com", "homephone"=>"6154385000","street"=>"3155 19th St NW", "city"=>"Washington", "state"=>"DC", "zipcode"=>"20010"}
    q.insert(expected)

    assert_equal [{"first_name"=>"Allison", "last_name"=>"Nguyen",  "email_address"=>"arannon@jumpstartlab.com", "homephone"=>"6154385000","street"=>"3155 19th St NW", "city"=>"Washington", "state"=>"DC", "zipcode"=>"20010", "district" =>0}], q.queue_district
  end

  def test_it_will_save_to_csv
    #testing for this and html ?
    q = Container.new
    expected = {"first_name"=>"Allison", "last_name"=>"Nguyen",  "email_address"=>"arannon@jumpstartlab.com", "homephone"=>"6154385000","street"=>"3155 19th St NW", "city"=>"Washington", "state"=>"DC", "zipcode"=>"20010"}

    assert_equal 0, q.count

    q.insert(expected)

    assert "event_attendees.csv"
  end

  def test_it_will_export_to_html
    q = Container.new
    expected = { "first_name"=>"Allison", "last_name"=>"Nguyen",  "email_address"=>"arannon@jumpstartlab.com", "homephone"=>"6154385000","street"=>"3155 19th St NW", "city"=>"Washington", "state"=>"DC", "zipcode"=>"20010"}

    assert_equal 0, q.count

    q.insert(expected)
    assert "output_table4.html"
  end



end
