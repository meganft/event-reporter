require 'pry'
require './lib/manager'
require './lib/help'
require './lib/container'

class Repl

  include Help

  def initialize
    @manager = Manager.new
    @container = Container.new
  end

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

  def do_help
    case @command2
    when nil then Help.commands
    when "find" then  Help.find
    end
    case @command3
    when "count" then  Help.count
    when "clear" then  Help.clear
    when "district" then  Help.district
    when "print" then  Help.print_queue
    when "print_by" then  Help.print_by
    when "save" then  Help.save
    when "export" then  Help.export
    end
  end

  def do_queue
    case @command2
    when "count" then puts @manager.count
    when "clear" then  puts @manager.clear
    when "district" then @manager.queue_district
    when "print" then  @manager.queue_print
    when "print_by" then  @manager.queue_print_by(@command3)
    when "save" then  @manager.queue_save(@command3)
    when "export" then  @manager.queue_export(@command3)
    end
  end

end
