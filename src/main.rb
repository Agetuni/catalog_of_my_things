def main
  puts 'Welcome to My catalog of things'
  puts ''
  loop do
    options
    choice = gets.chomp
    return if choice == '13'

    startup(choice)
  end
end

def startup(choice)
  case choice
  when '1'
    puts ''
    puts "#{chioice} choice selected"
    puts ''
  end
end

def options
  puts 'Select a number to start an action'
  puts ''
  puts '1 - List all books'
  puts '2 - List all music albums'
  puts '3 - List all games'
  puts '4 - List all movies'
  puts '5 - List all genres'
  puts '6 - List all labels'
  puts '7 - List all authors'
  puts '8 - List all sources'
  puts '9 - Add a book'
  puts '10 - Add a music album'
  puts '11 - Add a game'
  puts '12 - Add a movie'
  puts '13 - Exit'
  puts ''
end

main
