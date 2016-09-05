require 'csv'

class CSVLoader

  def open_file(filename = "full_event_attendees.csv")
    @contents = CSV.read filename, headers: true, header_converters: :symbol
  end

end

# puts c = CSVLoader.new
# puts c.open_file(filename = "full_event_attendees.csv")
