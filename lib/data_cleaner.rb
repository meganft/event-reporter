require 'pry'
module DataCleaner

  def DataCleaner.clean_first_name(first_name)
    first_name.to_s.downcase.capitalize
  end

  def DataCleaner.clean_last_name(last_name)
    last_name.to_s.downcase.capitalize
  end

  def DataCleaner.clean_email(email_address)
    email_address.to_s
  end

  def DataCleaner.clean_phone_number(homephone)
    homephone.to_s.chars.grep(/\d/).join.rjust(10,"0")[0..9]
  end

  def DataCleaner.clean_street(street)
    street.to_s
  end

  def DataCleaner.clean_city(city)
    city.to_s.downcase.capitalize
  end

  def DataCleaner.clean_state(state)
    state.to_s.upcase
  end

  def DataCleaner.clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end

private

  def DataCleaner.clean_attendees(attendees)
    cleaned_attendees = {}

    attendees.each_with_index do |row, i|
    first_name = clean_first_name(row[:first_name])
    last_name = clean_last_name(row[:last_name])
    zipcode = clean_zipcode(row[:zipcode])
    email_address = clean_email(row[:email_address])
    homephone = clean_phone_number(row[:homephone])
    street = clean_street(row[:street])
    city = clean_city(row[:city])
    state = clean_state(row[:state])
    zipcode = clean_zipcode(row[:zipcode])

    cleaned_attendees[i+1] = {"first_name" => first_name,"last_name" => last_name, "email_address" => email_address, "homephone" => homephone, "street" => street, "city" => city, "state" => state, "zipcode" => zipcode}
    end
    return cleaned_attendees

  end

end
