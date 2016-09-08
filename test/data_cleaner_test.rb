require_relative 'test_helper'
require './lib/data_cleaner'

class DataCleanerTest < Minitest::Test

  def test_it_can_clean_first_name
    assert_equal "Megan", DataCleaner.clean_first_name("megan")

    assert_equal "Megan", DataCleaner.clean_first_name("MEGAN")

    assert_equal "Megan", DataCleaner.clean_first_name("MeGaN")
  end

  def test_it_can_clean_last_name
    assert_equal "Talbot", DataCleaner.clean_last_name("talbot")

    assert_equal "Talbot", DataCleaner.clean_last_name("TALBOT")

    assert_equal "Talbot",DataCleaner.clean_last_name("TaLboT")
  end

  def test_it_can_clean_email_address
    assert_equal "meganftalbot@gmail.com", DataCleaner.clean_email("meganftalbot@gmail.com")
    #
    # assert_equal "Talbot", DataCleaner.clean_last_name("TALBOT")
  end

  def test_it_can_clean_phone_number
    assert_equal "6033053000",  DataCleaner.clean_phone_number("(603) 305-3000")

    assert_equal "7782327000", DataCleaner.clean_phone_number("778.232.7000")
  end

  def test_it_can_clean_street
    assert_equal "1510 Blake Street",  DataCleaner.clean_street("1510 Blake Street")
  end

  def test_it_can_clean_city
    assert_equal "Denver", DataCleaner.clean_city("denver")

    assert_equal "Denver", DataCleaner.clean_city("DENVER")

    assert_equal "Denver", DataCleaner.clean_city("DeNvEr")
  end

  def test_it_can_clean_state
    assert_equal "CO", DataCleaner.clean_state("co")

    assert_equal "CO", DataCleaner.clean_state("Co")

    # assert_equal 2, d.clean_state.length("co")
  end

  def test_it_can_clean_zipcodes
    assert_equal "00000", DataCleaner.clean_zipcode("00")

    assert_equal "12345", DataCleaner.clean_zipcode("12345678")

    assert_equal "00000", DataCleaner.clean_zipcode("")
  end

  # def test_it_returns_cleaned_attendee_in_hash
  #   input = ("Allison")
  #
  #   assert_instance_of Hash,    DataCleaner.clean_attendees(input)
  #
  #
  # end

end
