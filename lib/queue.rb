require './lib/data_cleaner'
# require './lib/attendee_builder'

class Queue

  attr_accessor :data_cleaner, :attendees_clean

  def initialize
    # @data = Hash.new
    @data_cleaner = DataCleaner.new
  end

  def insert_queue_hash
    #insert attendees from attendee builder or from data cleaner,
    queue_hash = {}
    queue_hash["first_name"] = @data_cleaner.attendees_clean

  end

  def count
    # count hash made above hash.count
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

puts q = Queue.new
puts q.insert_queue_hash
