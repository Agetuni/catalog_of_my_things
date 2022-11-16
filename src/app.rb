class App
  def initialize
    @response = 0
  end

  def options
    puts 'Welcome to My catalog of things'
    while @response != 11
      puts(
        'Select a number to start an action:
        1 - List all books
        2 - List all music albums
        3 - List of games
        4 - List all labels
        5 - List all genres
        6 - List all authors
        7 - List all sources
        8 - Add a book
        9 - Add a music album
        10 - Add a game
        11 - Exit'
      )
      start_up
    end
  end

  def start_up
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