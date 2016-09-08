require 'pry'
require './lib/manager'
require './lib/help'
require './lib/container'
# require './lib/event_reporter'

class Repl

  include Help

  def initialize
    @manager = Manager.new
    @container = Container.new
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
    case @command1
    when "load" then @manager.load_file
    when "help" then do_help
    when "queue" then do_queue
    when "find" then @manager.find(@command2, @command3)
    when "quit" then puts "Thanks for visiting!" && exit!
    else puts "I'm not sure what you mean. Try a different command."
    end
    command
  end
  #
  # def do_load
  #
  #  @manager.load
  # end

  def do_help
    case @command1
    when "help" then Help.commands
    end
    #figure out how to take command 1 out of this method to avoid dupliate printing
    case @command2
    when "count" then  Help.count
    when "clear" then  Help.clear
    when "district" then  Help.district
    when "print" then  Help.print
    when "print_by" then  Help.print_by
    when "save" then  Help.save
    when "export" then  Help.export
    when "find" then  Help.find
    end
  end

  def do_queue
    case @command2
    when "count" then puts @manager.count
    when "clear" then  puts @manager.clear
    when "district" then @container.queue_district
    when "print" then  @container.queue_print
    when "print_by" then  @container.print_by(@command3)
    when "save" then  @container.save(@command3)
    when "export" then  @container.export(@command3)
    end
  end

  # def do_find
  #   case @command1
  #   when "find" then @manager.find(@command2, @command3)
  #   end
  # end

end

puts r = Repl.new
puts r.command
