require 'csv'
require './lib/csv_loader'

class DataCleaner

  def id(id)
    id.to_i
  end

  def first_name(firstname)
    firstname.to_s.downcase.capitalize
  end

  def last_name(lastname)
    lastname.to_s.downcase.capitalize
  end

  def email(email_address)
    email_address
  end

  def phone_number(homephone)
    homephone.to_s.chars.grep(/\d/).join.rjust(10,"0")
  end

  def street(street)
    street
  end

  def city(city)
    city.to_s.downcase.capitalize
  end

  def state(state)
    state.to_s.upcase
  end

  def zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end

end

puts d = DataCleaner.new
puts d.last_name("talbot")


# Used this to test
 # contents = CSV.read "full_event_attendees.csv", headers: true, header_converters: :symbol
  # contents.each do |row|
  #   first_name = clean_first_name(row[:first_name])
  #   last_name = clean_last_name(row[:last_name])
  #   email_address = clean_email(row[:email_address])
  #   zipcode = clean_zipcode(row[:zipcode])
  #   city = clean_city(row[:city])
  #   state = clean_state(row[:state])
  #
  #   puts "#{first_name} #{last_name} #{email_address} #{zipcode} #{city} #{state}"
