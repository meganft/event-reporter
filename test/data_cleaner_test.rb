require 'pry'
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/data_cleaner'

class DataCleanerTest < Minitest::Test

  def test_it_can_clean_zipcodes
    d = DataCleaner.new

    assert_equal "00000", d.zipcode("00")

    assert_equal "12345", d.zipcode("12345678")

    assert_equal "00000", d.zipcode("")
  end

  def test_it_can_clean_phone_number
    d = DataCleaner.new

    assert_equal "6033053000",  d.phone_number("(603) 305-3000")

    assert_equal "7782327000", d.phone_number("778.232.7000")
  end

  def test_it_can_clean_first_name
    d = DataCleaner.new

    assert_equal "Megan", d.first_name("megan")

    assert_equal "Megan", d.first_name("MEGAN")

    assert_equal "Megan", d.first_name("MeGaN")
  end

  def test_it_can_clean_last_name
    d = DataCleaner.new

    assert_equal "Talbot", d.last_name("talbot")

    assert_equal "Talbot", d.last_name("TALBOT")

    assert_equal "Talbot", d.last_name("TaLboT")
  end

  def test_it_can_clean_city
    d = DataCleaner.new

    assert_equal "Denver", d.city("denver")

    assert_equal "Denver", d.city("DENVER")

    assert_equal "Denver", d.city("DeNvEr")
  end

  def test_it_can_clean_state
    d = DataCleaner.new

    assert_equal "CO", d.state("co")

    assert_equal "CO", d.state("Co")
  end

end
