require 'active_record'
require './lib/station'
require './lib/line'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations["development"]
ActiveRecord::Base.establish_connection(development_configuration)


puts 'Hello!'

def prompt text
  puts text
  gets.chomp
end


def menu
  choice = nil
  until choice == 'e'
    puts "Press 'station' to add station, press 'line' to add line
          press 'ls' to list stations, press 'll' to list lines, press 'set' to
          set station on line, press 'list' to list all, 'cl' to change line"
    choice = gets.chomp
    case choice
      when 'station'
        add_station
      when 'line'
        add_line
      when 'ls'
        list_stations
      when 'll'
        list_lines
      when 'set'
        set_line
      when 'list'
        list_all
      when 'cl'
        change_line
      else
        invalid
    end
  end
end

def add_station
  name = prompt 'Enter the name of the station'
  station = Station.new(:name => name)
  if station.save
    puts "#{station.name} has been saved!"
  else
    puts 'something went wrong'
  end
end

def add_line
  name = prompt 'Enter the name of the station'
  line = Line.new(:name => name)
  if line.save
    puts "#{line.name} has been saved!"
  else
    puts 'something went wrong'
  end
end

def list_stations
  Station.all.each do |station|
    puts station
  end
end

def list_lines
  Line.all.each do |line|
    puts line
  end
end

def set_line
  list_stations
  station_id = prompt('Enter station id to set').to_i
  station = Station.find(station_id)

  list_lines
  line_id = prompt ('Enter line id to set').to_i
  line = Line.find(line_id)

  station.lines << line
  if station.save
    puts 'connection saved'
  else
    puts 'something went wrong'
  end

end

def list_all
  Station.all.each do |station|
    puts station
    station.lines.each do |line|
      puts '    ' + line.to_s
    end
  end
end

def change_line
  list_lines
  line_id = prompt('Enter line id to change').to_i
  line = Line.find(line_id)
  new_name = prompt 'Enter new line name'
  line.update_attributes(:name => new_name)
end

menu