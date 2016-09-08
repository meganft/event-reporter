require './lib/manager'
require './lib/help'
require './lib/queue'
# require './lib/event_reporter'

class Repl

include Help

  def initialize
    @manager = Manager.new
    @queue = Queue.new
    # @help = Help.new
  end

  puts "Welcome to event reporter! What can I help you with today?"


  def command
    input = gets.chomp
    input = input.downcase.split(' ')
    @command1 = input[0]
    @command2 = input[1]
    @command3 = input[2]
    do_command
  end

  def do_command
    if @command1 == "load"
      puts @manager.load
    elsif @command1 == "queue" && @command2 == "count"
       puts @manager.count
    elsif @command1 == "queue" && @command2 == "print"
      @queue.print
    elsif @command1 == "help"
      Help.commands
    elsif @command1 == "help" && @command2 == "count"
      Help.count
    elsif @command1 == "help" && @command2 == "clear"
      Help.clear
    elsif @command1 == "help" && @command2 == "district"
      Help.district
    elsif @command1 == "help" && @command2 == "print"
      Help.print
    elsif @command1 == "help" && @command2 == "print_by"
      Help.print_by
    elsif @command1 == "help" && @command2 == "save"
      Help.save
    elsif @command1 == "help" && @command2 == "export"
      Help.export
    elsif @command1 == "help" && @command2 == "find"
      Help.find
    elsif @command1 == "find" #this one didn't load
      @manager.find(@command2,@command3)
    elsif @command1 == "save"
      @queue.save()

    elsif @command1 == "quit"
      puts "Thank you for visiting Event Reporter!"
    else puts "Not a good command. Try again!"
  end
  end

end

# puts r = Repl.new
# puts r.command
