require_relative './classes/game'
require_relative './classes/movie'
require_relative './classes/author'
require_relative './classes/source'

module Functionalities
  def add_game
    puts 'Published Date: '
    published_date = gets.chomp

    print 'Is it a multiplayer game? [Y/N]: '
    multiplayer = gets.chomp.to_s.downcase == 'y'

    print 'When was it last played at? '
    last_played_at = gets.chomp

    game = Game.new(published_date, multiplayer, last_played_at)
    @games << game

    puts 'Time to add an author! '
    puts 'First Name: '
    first_name = gets.chomp
    puts 'Last Name: '
    last_name = gets.chomp

    author = Author.new(first_name, last_name)
    @author << author
    author.add_item(game)
  end

  def add_movie
    puts 'Movie Title: '
    movie_title = gets.chomp

    puts 'Published Date: '
    published_date = gets.chomp

    print 'Is it a silent movie? [Y/N]: '
    silent = gets.chomp.to_s.downcase == 'y'

    movie = Movie.new(published_date, movie_title, silent)
    @movies << movie
    puts 'Time to add a source! '
    puts 'This is the list of sources available:'
    list_source

    puts 'Choose an option'
    puts '[ 1 ] Select a source from the list'
    puts '[ 2 ] Add a new source'
    source_option = gets.chomp.to_i
    if source_option == 1
      print 'ID of the source: '
      id_source = gets.chomp.to_i
      @source.each do |source|
        movie.add_source(source) if source.id == id_source
      end
    else
      print 'Name: '
      name = gets.chomp
      source = Source.new(name)
      @source << source
      source.add_item(movie)
    end
  end

  def list_games
    puts 'No available games' if @games.empty?

    @games.each_with_index do |game, index|
      puts "#{index + 1}) Author: #{game.author.first_name} #{game.author.last_name}"
      puts "Multiplayer: #{game.multiplayer}, Last played: #{game.last_played_at}, Publish date: #{game.publish_date}"
    end
  end

  def list_authors
    return puts 'No authors found' if @author.empty?

    @author.each_with_index do |author, index|
      puts "#{index + 1}) First Name: #{author.first_name}, Last Name: #{author.last_name}"
    end
  end

  def list_movies
    puts 'No available movie' if @source.empty?
    @movies.each_with_index do |value, index|
      puts "#{index + 1}) Source Name: #{value.source.name}"
      puts "Title: #{value.title}, Silent: #{value.silent}, Publish date: #{value.publish_date}"
    end
  end

  def list_source
    puts 'No available source' if @source.empty?
    @source.each_with_index do |value, index|
      puts "#{index + 1}) Source Name: #{value.name}, Source ID: #{value.id}"
    end
  end
end
