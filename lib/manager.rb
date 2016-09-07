require 'pry'
require 'csv'
require './lib/data_cleaner'
require './lib/queue'

class Manager

  include DataCleaner

  attr_reader :queue

  def initialize
    @queue = Queue.new
  end

  def load(filename = 'full_event_attendees.csv')
    attendees = CSV.open filename, headers: true, header_converters: :symbol
    @clean_attendees = clean(attendees)
  end

  def clean(attendees)
    clean_attendees = DataCleaner.clean_attendees(attendees)
  end

  def find(attribute, criteria)
    @clean_attendees.select do |row, attendee|
      @queue.insert(attendee) if attendee[attribute] == criteria
      end
# binding.pry
  end

  def count
    @queue.count
  end

  def clear
    @queue.clear
  end



end
