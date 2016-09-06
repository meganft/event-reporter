#putting cleaning and attendee builder together to see if ti works better

require 'pry'

class Attendee

  attr_accessor :first_name, :last_name, :phone_number, :zip_code, :email, :city, :state, :address

  def initialize(data = {})
    @first_name = clean_first_name(data[:first_name])
    @last_name = clean_last_name(data[:last_name])
    @phone_number = clean_phone_number(data[:phone_number])
    @zip_code = clean_zipcode(data[:zip_code])
    @email = clean_email(data[:email])
    @city = clean_city(data[:city])
    @state = clean_state(data[:state])
  end

  def clean_id(data)
    data.to_i
  end

  def clean_first_name(data)
    data.to_s.downcase.capitalize
  end

  def clean_last_name(data)
    data.to_s.downcase.capitalize
  end

  def clean_email(data)
    data
  end

  def clean_phone_number(data)
    data.to_s.chars.grep(/\d/).join.rjust(10,"0")
  end

  def clean_street(data)
    data
  end

  def clean_city(data)
    data.to_s.downcase.capitalize
  end

  def clean_state(data)
    data.to_s.upcase
  end

  def clean_zipcode(data)
    data.to_s.rjust(5,"0")[0..4]
  end


end

puts a = Attendee.new
puts a.clean_state("co")
