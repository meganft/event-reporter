#need to work on, added the builder into the data cleaner file, where it worked

require 'pry'
require './lib/data_cleaner'

class Attendee

  attr_accessor :id, :first_name, :last_name, :email, :phone_number, :street, :city, :state, :zipcode, :data_cleaner

  def initialize
    @data_cleaner = DataCleaner.new
  end

  def build_attendees(row)
    @id = @data_cleaner.id(row[:id])
    @first_name = @data_cleaner.first_name(row[:first_name])
    @last_name = @data_cleaner.last_name(row[:last_name])
    @email = @data_cleaner.email(row[:email_address])
    @phone_number = @data_cleaner.phone_number(row[:homephone])
    @street = @data_cleaner.street(row[:street])
    @city = @data_cleaner.city(row[:city])
    @state = @data_cleaner.state(row[:state])
    @zipcode = @data_cleaner.zipcode(row[:zipcode])
  end

end

puts a = Attendee.new
puts a.attendee
# binding.pry
