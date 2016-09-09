module Help

  def Help.commands
    puts  "The available individual commands are: [load <filename>] [queue count] [queue clear] [queue district] [queue print] [queue print by <attribute>] [queue save to <filename.csv>] [queue export html <filename.csv>] [find <attribute> <criteria>]. Type the command name to learn more about each!"
  end

  def Help.count
    puts "Outputs how many records are in the current queue."
  end

  def Help.clear
    puts "Empties the queue."
  end

  def Help.district
    puts "If there are less than 10 entries in the queue, this command will use the Sunlight API to get Congressional District information for each entry."
  end

  def Help.print_queue
    puts "Prints out tab-delimited data table with a header row."
  end

  def Help.print_by
    puts "Prints the data table sorted by the specified attribute like zipcode."
  end

  def Help.save
    puts "Exports the current queue to the specified filename as a  CSV."
  end

  def Help.export
    puts "Exports the current queue to the specified filename as a valid HTML file."
  end

  def Help.find
    puts "Loads the queue with all records matching the criteria for the given attribute."
  end

end
#
# puts Help.help
