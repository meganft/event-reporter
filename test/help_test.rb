require_relative 'test_helper'
require './lib/help'

class HelpTest < Minitest::Test

  def test_help_prints_a_listing_of_possible_commands
     assert_equal nil, Help.commands
   end
   #add more tests to cover all help commands
end
