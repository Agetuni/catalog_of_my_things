# rubocop:disable Metrics/CyclomaticComplexity
require_relative './app'
require_relative 'classes/musicalbum'
require_relative 'classes/genre'
require_relative 'handle/handle_genre'
require_relative 'modules/book_module'
require_relative './modules/preserve_module'
require_relative './modules/game_module'
require_relative './modules/movie_module'

class App
  include HandleGenre
  include BookModule
  include GameModule
  include MovieModule
  def initialize
    @response = 0
    @movies = load_movies
    @music_albums = []
    @games = load_games
    @source = load_source
    @author = load_author
    @labels = load_labels
    @genres = []
    @books = load_books

    load_genres
    load_games
  end

  def options
    puts 'Welcome to My catalog of things'
    while @response != 13
      puts(
        'Select a number to start an action:
          1 - List all books
          2 - List all music albums
          3 - List all movies
          4 - List of games
          5 - List all genres
          6 - List all labels
          7 - List all authors
          8 - List all sources
          9 - Add a book
          10 - Add a music album
          11 - Add a movie
          12 - Add a game
          13 - Exit'
      )
      start_up
    end
  end

  def start_up
    @response = gets.chomp.to_i
    if @response >= 1 && @response <= 8
      list_items
    else
      add_item
    end
    store_books(@books)
    store_labels(@labels)
  end

  def list_items
    case @response
    when 1
      list_books
    when 2
      list_music_albums
    when 3
      list_movies
    when 4
      list_games
    when 5
      list_genres
    when 6
      list_labels
    when 7
      list_authors
    when 8
      list_source
    else
      puts 'Invalid input'
    end
  end

  def add_item
    case @response
    when 9
      add_book
    when 10
      add_music_album
    when 11
      add_movie
    when 12
      add_game
    end
  end

  def user_input(message)
    print message
    gets.chomp
  end
end
# rubocop:enable Metrics/CyclomaticComplexity
