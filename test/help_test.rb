require_relative 'test_helper'
require './lib/help'

class HelpTest < Minitest::Test

  def test_help_prints_a_listing_of_possible_commands
     assert_equal nil, Help.commands
  end

  def test_help_prints_a_about_count_method
     assert_equal nil, Help.count
  end

  def test_help_prints_a_about_clear_method
     assert_equal nil, Help.clear
  end

  def test_help_prints_a_about_district_method
     assert_equal nil, Help.district
  end

  def test_help_prints_a_about_print_method
     assert_equal nil, Help.print_queue
  end

  def test_help_prints_a_about_print_by_method
     assert_equal nil, Help.print_by
  end

  def test_help_prints_a_about_save_method
     assert_equal nil, Help.save
  end

  def test_help_prints_a_about_export_method
     assert_equal nil, Help.export
  end

  def test_help_prints_a_about_find_method
     assert_equal nil, Help.find
  end
end
