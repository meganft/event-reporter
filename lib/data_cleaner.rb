require 'pry'
require 'csv'
# require './lib/csv_loader'

class DataCleaner

  attr_accessor :contents, :attendees_clean

  def contents
    contents = CSV.open 'full_event_attendees.csv', headers: true, header_converters: :symbol
  end

  def clean_id( )
    id.to_i
  end

  def clean_first_name(first_name)
    first_name.to_s.downcase.capitalize
  end

  def clean_last_name(last_name)
    last_name.to_s.downcase.capitalize
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

  def clean_attendees
  cleaned_attendees = Hash.new
   contents.each_with_index do |row, i|
    first_name = clean_first_name(row[:first_name])
    last_name = clean_last_name(row[:last_name])
    zipcode = clean_zipcode(row[:zipcode])
    email_address = clean_email(row[:email_address])
    homephone = clean_phone_number(row[:homephone])
    street = clean_street(row[:street])
    city = clean_city(row[:city])
    state = clean_state(row[:state])
    zipcode = clean_zipcode(row[:zipcode])

    cleaned_attendees[i + 1] = {"first_name" => first_name,"last_name" => last_name, "email_address" => email_address, "homephone" => homephone, "street" => street, "state" => state, "zipcode" => zipcode}
    end
    return cleaned_attendees
  end

end

# puts d = DataCleaner.new
# puts d.clean_attendees
