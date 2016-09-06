# Put this into the data cleaner file, and it worked there
# 
# require 'pry'
# require './lib/data_cleaner'
#
# class Attendee
#
#   attr_accessor :id, :first_name, :last_name, :email, :phone_number, :street, :city, :state, :zipcode, :data_cleaner
#
#   # def initialize
#   #   @ = DataCleaner.new
#   # end
#
#   def build_attendees
#     d = DataCleaner.new
#     # @id = d..id(row[:id])
#     @first_name = d.cleanfirst_name(row[:first_name])
#     @last_name = d.clean_last_name(row[:last_name])
#     @email = d.clean_email(row[:email_address])
#     @phone_number = d.clean_phone_number(row[:homephone])
#     @street = d.clean_street(row[:street])
#     @city = d.clean_city(row[:city])
#     @state = d.cleanstate(row[:state])
#     @zipcode = d.clean_zipcode(row[:zipcode])
#   end
#
#   def clean_attendees
#     contents = CSV.open 'full_event_attendees.csv', headers: true, header_converters: :symbol
#     cleaned_attendees = {}
#    contents.each do |row|
#     firstname = clean_first_name(row[:first_name])
#     lastname = clean_last_name(row[:last_name])
#     zipcode = clean_zipcode(row[:zipcode])
#
#     cleaned_attendees[row[:id]] = {"first_name" => firstname,"last_name" => lastname}
#     end
#     return cleaned_attendees
#   end
#
# end
#
# puts a = Attendee.new
# puts a.attendee
# binding.pry
