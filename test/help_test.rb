require 'pry'
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/help'

class HelpTest < Minitest::Test

  def test_help_prints_a_listing_of_possible_commands
     assert_equal nil, Help.all
   end

end
