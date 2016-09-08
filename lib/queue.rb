require 'pry'
require 'csv'
# require 'sunlight/congress'
require 'json'
require 'open-uri'
require 'erb'
# require './lib/manager'

class Queue

  # Sunlight::Base.api_key = "43e0b18e571447ecba2bb84b44dd4209"

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

  def district_info(zipcode)
    url = "http://congress.api.sunlightfoundation.com/districts/locate?zip=#{zipcode}&apikey=43e0b18e571447ecba2bb84b44dd4209"
    data = JSON.parse(open(url).read)
    district_number = data["results"][0]["district"]
  end

  def queue_district
    i = 0
    if @queue.count < 10
      @queue.each do |attendee|
        zipcode = @queue[i]["zipcode"]
        district_number = district_info(zipcode)
        @queue[i].merge!("district" => district_number)
        i += 1
      end
      @queue
    else puts "Too many entries"
   end
  end

  def print
    printf "\n%-15s %-15s %-30s %-10s %-20s %-10s %-45s %-15s %s\n", "LAST NAME", "FIRST NAME", "EMAIL", "ZIPCODE", "CITY", "STATE", "STREET", "PHONE", "DISTRICT"
    queue.each_with_index do |row, i|
      printf "%-15s %-15s %-30s %-10s %-20s %-10s %-35s %s\n",
      queue[i]['last_name'],
      queue[i]['first_name'], queue[i]['email_address'], queue[i]['zipcode'],
      queue[i]['city'],
      queue[i]['state'],
      queue[i]['street'],
      queue[i]['phone']
      queue[i]['district']
    end
  end

  def print_by(attribute)
    @queue = queue.sort_by do |attendee|
      attendee[attribute]
      end
      print
        
  end

  def save(filename = "event_attendes.csv")
    Dir.mkdir("output") unless Dir.exists? "output"
    CSV.open("output/#{filename}",'wb') do |csv|
      csv << @queue.first.keys
      @queue.each do |hash|
        csv << hash.values
      end

    end
  end

  def export
    # binding.pry
    # template = File.read "html_format.erb"
    # erb_template = ERB.new template
    #   @queue.each do |hash|
    #     hash.values
    # table = erb_template.result
    # Dir.mkdir("output") unless Dir.exists? "output"

    # File.open(filename,'w') do |file|
    #   file.puts table

    template = File.read "html_format.erb"
    erb_template = ERB.new template
    export_report = erb_template.result(binding)
    filename = "output_table.html"
    File.open("./output/#{filename}",'w') do |file|
      file.puts export_report

    end

  end

end
# puts a = Queue.new
# puts a.print
# puts a.count
