class App
  def initialize
    @response = 0
  end

  def options
    puts 'Welcome to My catalog of things'
    while @response != 13
      puts(
        'Select a number to start an action:
        1 - List all books
        2 - List all music albums
        3 - List of games
        4 - List all movies
        5 - List all labels
        6 - List all genres
        7 - List all authors
        8 - List all sources
        9 - Add a book
        10 - Add a music album
        11 - Add a game
        12 - Add a movie
        13 - Exit'
      )
      startup
    end
  end

  def startup
    @response = gets.chomp.to_i
    if @response >= 1 && @response <= 6
      list_items
    else
      add_item
    end
  end

  def list_items
    case @response
    when 1
      list_books
    when 2
      list_music_albums
    when 3
      list_games
    when 4
      list_genres
    when 5
      list_labels
    when 6
      list_authors
    else
      puts 'Invalid input'
    end
  end

  def add_item
    case @response
    when 7
      add_book
    when 8
      add_music_album
    when 9
      add_game
    when 10
      add_label
    when 11
      add_genre
    when 12
      add_author
    end
  end
end
