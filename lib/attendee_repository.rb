# require 'csv'
#
# class AttendeeRepository
#
#   attr_reader :csv, :records
#
#   def initialize(filename = "./full_event_attendees.csv")
#     @csv = CSV.read(filename, headers: true, header_converters: :symbol)
#     @records = []
#   end
#
#   def build_attendee_records
#     csv.each { |row| @records << AttendeeBuilder.build(row) }
#     records
#   end
# end
