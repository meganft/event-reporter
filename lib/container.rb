require 'pry'
require 'csv'
require 'json'
require 'open-uri'
require 'erb'
require './lib/manager'
require './lib/data_cleaner'

class Container

  attr_accessor  :queue

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
    @queue = []
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
    else puts "Sorry, there are too many entries to lookup district information."
   end
  end

  def queue_print
      i = 0
      printf "%-12s %-12s %-42s %-10s %-27s %-7s %-40s %-12s %s\n", "LAST NAME", "FIRST NAME", "EMAIL", "ZIP CODE", "CITY", "STATE", "ADDRESS", "PHONE",  "DISTRICT"
      @queue.each do |elem|
        printf "%-12s %-12s %-42s %-10s %-27s %-7s %-40s %-12s %s\n", @queue[i]["last_name"], @queue[i]["first_name"], @queue[i]["email_address"], @queue[i]["zipcode"], @queue[i]["city"], @queue[i]["state"], @queue[i]["street"], @queue[i]["homephone"], @queue[i]["district"]
        i += 1
    end
  end

  def print_by(attribute)
    @queue = queue.sort_by do |attendee|
      attendee[attribute]
      end
      queue_print
  end

  def save(filename)
    Dir.mkdir("output") unless Dir.exists? "output"
    CSV.open("output/#{filename}",'wb') do |csv|
      if @queue != []
        csv << @queue.first.keys
        @queue.each do |hash|
          csv << hash.values
        end
      elsif @queue == []
        csv << ["last_name", "first_name", "email_address", "zipcode", "city", "state", "street", "homephone", "district"]
      end
    end
  end

  def export(filename)
    template = File.read "html_format.erb"
    erb_template = ERB.new template
    export_report = erb_template.result(binding)
    # filename = "output_table4.html"
    File.open("./output/#{filename}",'w') do |file|
      file.puts export_report
    end
  end

end
# puts a = Queue.new
# puts a.find("last_name","Johnson")
# puts a.count
