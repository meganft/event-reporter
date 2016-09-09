require './lib/repl'

class EventReporter

  repl = Repl.new
  puts "Welcome to Event Reporter! What can I do for you today?"
  repl.command

end
