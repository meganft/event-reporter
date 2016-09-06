require 'pry'
require 'csv'
# require './lib/manager'

class Queue

  attr_accessor :queue

  def initialize
    @queue = []
  end

  def insert(attendee)
    @queue << attendee
  end

  def count
   @queue.count
  end

  def clear
    @queue.clear
  end

  def district
    
  end

  def print
    binding.pry
    @queue.each do |line|
      puts line
    end

  end

  def print_by
    #do a sort by first and then print the answer
  end

  def save
    @queue

  end

  def export  #html

  end



end
# puts a = Queue.new
# puts  a.load_file('full_event_attendees.csv')
# # puts q = Queue.new
# puts q.count
