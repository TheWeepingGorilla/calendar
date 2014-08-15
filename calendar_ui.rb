require 'active_record'
require 'date'
require './lib/event'

database_configurations = YAML::load(File.open('./db/config.yml'))
test_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(test_configuration)

def header
  system 'clear'
  puts "*" * 50
  puts "Calendar"
  puts "*" * 50
  puts "\n"
end

def main_menu
  header
  puts "E > Edit an event"
  puts "A > Add an event"
  puts "D > Delete an event"
  puts "X > Exit"
  choice = gets.chomp.upcase
  case choice
  when 'A'
    add_event
  when 'E'
    edit_event
  when 'D'
    delete_event
  when 'X'
    puts "Have an excellent day!"
    exit
  else
    puts 'Invalid input. Try again.'
  end
  main_menu
end

def add_event
  puts "Please enter a description of the event:"
  e_desc = gets.chomp
  puts "Please enter a location for the event:"
  e_loc = gets.chomp
  puts "Please enter a start date and time for the event."
  puts "Please use the following format: DD/MM/YYYY HH:MM:SS"
  puts "For example, 31/10/2014 22:00:00"
  e_start_unparsed = gets.chomp
  e_start = DateTime.strptime(e_start_unparsed, '%d/%m/%Y %H:%M:%S')
  puts "Please enter an end date and time for the event."
  puts "Please use the following format: DD/MM/YYYY HH:MM:SS"
  puts "For example, 31/10/2014 23:00:00"
  e_end_unparsed = gets.chomp
  e_end = DateTime.strptime(e_end_unparsed, '%d/%m/%Y %H:%M:%S')
  new_event = Event.create({:description => e_desc, :location => e_loc,
                            :start => e_start, :end => e_end})
  puts "Saved!  Press return to continue."
  gets
end

def edit_event


end

def delete_event
  puts
  Event.all.each do |event|
    puts "#{event.id}: #{event.description} at #{event.location}"
    puts "Starting at #{event.start} and ending at #{event.end}."
    puts "\n"
  end
  puts "Please enter id number of event to delete:"
  id_to_del = gets.chomp.to_i
  e_to_destroy = find_event_by_id(id_to_del)
  e_to_destroy.destroy
  puts "Event removed. Press return to continue."
  gets
end

def find_event_by_id(id)
  Event.all.each do |event|
    if event.id = id
      return event
    end
  end
  return 0
end

header
main_menu



# parsed_time = DateTime.strptime('03/05/2010 14:25:00', '%d/%m/%Y %H:%M:%S')

# parsed_time.to_s
