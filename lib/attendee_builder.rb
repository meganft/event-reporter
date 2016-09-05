require './lib/data_cleaner'

class Attendee

  # def self.build(row)
  #   data_cleaner = DataCleaner.new
  # end

  attr_accessor :id, :first_name, :last_name, :email, :phone_number, :street, :city, :state, :zipcode, :data_cleaner

  def initialize
    data_cleaner = DataCleaner.new
  end

  def attendee(row)
    @id = data_cleaner.id(row[:id])
    @first_name = data_cleaner.first_name(row[:first_name])
    @last_name = data_cleaner.last_name(row[:last_name])
    @email = data_cleaner.email(row[:email_address])
    @phone_number = data_cleaner.phone_number(row[:homephone])
    @street = data_cleaner.street(row[:street])
    @city = data_cleaner.clean_city(row[:city])
    @state = data_cleaner.clean_state(row[:state])
    @zipcode = data_cleaner.clean_zipcode(row[:zipcode])
  end

end

puts a = Attendee.new
puts a.attendee
