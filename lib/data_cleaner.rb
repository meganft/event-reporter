require 'pry'
require 'csv'
require './lib/csv_loader'

class DataCleaner

  attr_accessor :contents, :attendees_clean

  def clean_id( )
    id.to_i
  end

  def clean_first_name(firstname)
    firstname.to_s.downcase.capitalize
  end

  def clean_last_name(lastname)
    lastname.to_s.downcase.capitalize
  end

  def clean_email(email_address)
    email_address
  end

  def clean_phone_number(homephone)
    homephone.to_s.chars.grep(/\d/).join.rjust(10,"0")
  end

  def clean_street(street)
    street
  end

  def clean_city(city)
    city.to_s.downcase.capitalize
  end

  def  clean_state(state)
    state.to_s.upcase
  end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end

  def attendees_clean
  contents = CSV.open 'full_event_attendees.csv', headers: true, header_converters: :symbol
  cleaned_attendees = {}
   contents.each do |row|
    firstname = clean_first_name(row[:first_name])
    lastname = clean_last_name(row[:last_name])
    zipcode = clean_zipcode(row[:zipcode])

    cleaned_attendees[row[:id]] = {"first_name" => firstname,"last_name" => lastname}
    end
    return cleaned_attendees
  end

end

puts d = DataCleaner.new
puts d.attendees_clean
