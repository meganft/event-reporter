require 'pry'
require 'csv'
require 'sunlight'
# require './lib/manager'

class Queue

  Sunlight::Base.api_key = "43e0b18e571447ecba2bb84b44dd4209"

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
    # district = Sunlight::District.get(:address => "123 Fifth Ave New York, NY")
    # district.state
    # puts districts
  end

  def print
    printf "\n%-15s %-15s %-35s %s\n", "FIRST NAME", "LAST NAME", "EMAIL", "HOMEPHONE"
    queue.each_with_index do |attendee, i|
      printf "%-15s %-15s %-35s %s\n", queue[i]['first_name'], queue[i]['last_name'], queue[i]['email_address'], queue[i]['homephone']
    end
  end
    # printf queue.map { "%6s" }.join, *queue
    # i = 0
    # queue.each do |queue|
    #   printf "%-15s %-15s %-35s %s\n", queue[i]["first_name"]
    #   i += 1
    # end
  #   # queue.printf("%3d - %s\n")
  #
  # def print_by
  #   #do a sort by first and then print the answer
  # end
  #
  # def save
  #   # @queue
  #
  # end
  #
  # def export  #html
  #
  # end



end
# puts a = Queue.new
# puts a.print
# puts a.count
