require 'pry'
require 'csv'
require_relative 'data_cleaner'


class Queue

  attr_accessor :attendee_info

  def initialize
    @attendee_info = DataCleaner.new.clean_attendees
    binding.pry
  end

  def load_file

  end

  def insert_queue_hash
    #insert attendees from attendee builder or from data cleaner,
    # queue_hash = {}
    # queue_hash["first_name"] = @data_cleaner.attendees_clean

  end

  def count
    @attendee_info.count
  end

  def clear
    # just clear method on hash made above hash.clear
  end

  def print

  end

  def print_by
    #do a sort by first and then print the answer
  end

  def save

  end

  def export  #html

  end

  def district

  end



end
puts a = Queue.new
# puts  a.load_file('full_event_attendees.csv')
# # puts q = Queue.new
# puts q.count
