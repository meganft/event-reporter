require_relative 'test_helper'
require './lib/event_reporter'

class EventReporterTest < Minitest::Test
  def test_event_reporter_class_exists
    eventreporter = EventReporter.new
    assert_instance_of EventReporter
  end

end
