require './classes/game'
require './classes/movie'
require './classes/author'
require './classes/source'
require './classes/genre'
require './classes/label'
require './classes/book'
require 'json'

# rubocop:disable Metrics/ModuleLength
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

  ## books
  def load_books
    data = []
    file = './files/books.json'
    return data unless File.exist?(file) && File.read(file) != ''

    JSON.parse(File.read(file)).each do |book|
      new_book = Book.new(book['publish_date'], book['publisher'], book['cover_state'], archived: book['archived'])
      new_book.genre = Genre.new(book['genre'])
      new_book.author = Author.new(book['author']['first_name'], book['author']['last_name'])
      new_book.label = Label.new(book['label'])
      data << new_book
    end

    data
  end

  def list_books
    if @books.empty?
      puts 'The books list is empty'
    else
      puts '** Books list:'
      @books.each_with_index do |book, index|
        puts "#{index + 1}-[Book] ID: #{book.id} | Publisher: #{book.publisher} | " \
             "Publish date: #{book.publish_date} | Cover state: #{book.cover_state} | Archived: #{book.archived}"
      end
    end
  end

  def add_book
    author_first_name = user_input("Author's first name: ")
    author_last_name = user_input("Author's last name: ")
    author = Author.new(author_first_name, author_last_name)

    publish_date = user_input("Book's publish date: ")
    publisher = user_input("Book's publisher: ")
    cover_state = user_input("Book's cover state [good, bad]: ")
    genre = Genre.new(user_input("Book's genre: "))
    label = Label.new(user_input("Book's label: "))
    new_book = Book.new(publish_date, publisher, cover_state)
    new_book.genre = genre
    new_book.label = label
    new_book.author = author
    new_book.move_to_archive
    @books << new_book
    @labels << label
    @genres << genre
    puts 'The book  has been created successfully ✅'
  end

  def store_books(books)
    return if books.empty?

    file = './files/books.json'
    File.new('./files/books.json', 'w+') unless File.exist?(file)

    data = []

    books.each do |book|
      data << { id: book.id, publish_date: book.publish_date, publisher: book.publisher, cover_state: book.cover_state,
                archived: book.archived, genre: book.genre, author: book.author, label: book.label }
    end
    File.write(file, JSON.generate(data))
  end

  ## labels
  def store_labels(labels)
    return if labels.empty?

    file = './files/labels.json'
    File.new('./files/labels.json', 'w+') unless File.exist?(file)

    data = []

    labels.each do |label|
      data << { id: label.id, name: label.name }
    end
    File.write(file, JSON.generate(data))
  end

  def load_labels
    data = []
    file = './files/labels.json'
    return data unless File.exist?(file) && File.read(file) != ''

    JSON.parse(File.read(file)).each do |label|
      data << Label.new(label['name'], label['id'])
    end

    data
  end

  def list_labels
    if @labels.empty?
      puts 'The Labels list is empty'
    else
      puts '🏷️  Labels list:'
      @labels.each_with_index do |label, index|
        puts "#{index + 1}-[Label] ID: #{label.id} | Name: #{label.name}"
      end
    end
  end
end
# rubocop:enable Metrics/ModuleLength
