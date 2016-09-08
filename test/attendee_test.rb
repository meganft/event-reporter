#*** Took out

require 'pry'
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/attendee_builder'

class AttendeeBuilderTest < Minitest::Test

  def test_attendee_class_exists
    attendee = Attendee.new
    assert_equal Attendee, attendee.class
  end

end
