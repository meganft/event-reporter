require 'pry'
require 'csv'
require './lib/data_cleaner'
require './lib/container'

class Manager

  include DataCleaner

  attr_accessor :queue

  def initialize
    @queue = Container.new
    @clean_attendees = {}
  end

  def load_file(filename = 'full_event_attendees.csv')
    attendees = CSV.open filename, headers: true, header_converters: :symbol
    @clean_attendees = clean(attendees)
  end

  def clean(attendees)
    @clean_attendees = DataCleaner.clean_attendees(attendees)
  end

  def find(attribute, criteria)
    @queue.clear
    @clean_attendees.select do |row, attendee|
      @queue.insert(attendee) if attendee[attribute].downcase == criteria
    end
  end

  def count
    @queue.count
  end

  def clear
    @queue.clear
  end

  def queue_print
    @queue.queue_print
  end

  def queue_print_by(attribute)
    @queue.print_by(attribute)
  end

  def queue_district
    @queue.queue_district
  end

  def queue_export(filename)
    @queue.export(filename)
  end

  def queue_save(filename)
    @queue.save(filename)
  end

end
