require_relative '../classes/genre'

module MusicModule
  # Create a new music album
  def create_music
    puts 'Is the Music Album you want to create on spotify? [y/n]: '
    on_spotify = gets.chomp
    case on_spotify
    when 'y'
      on_spotify = true
    when 'n'
      on_spotify = false
    end
    puts 'Enter the date it was published in this format (YYYY-MM-DD): '
    publish_date = gets.chomp

    MusicAlbum.new(on_spotify, publish_date)
  end

  # Add a genre
  def add_new_genre
    puts 'Enter name of genre: '
    name = gets.chomp
    Genre.new(name)
  end

  def add_existing_genre
    list_genres
    puts 'Select ID of genre: '
    genre_id = gets.chomp.to_i
    @genres.find { |genre| genre.id == genre_id }
  end

  # Add a music album
  def add_music_album
    music = create_music
    puts 'For a new genre please enter [1] or to go to an existing genre enter [2]'
    genre = gets.chomp.to_i
    case genre
    when 1
      genre = add_new_genre
      @genres << genre.add_item(music)
      @music_albums << music
      save_genre
    when 2
      genre = add_existing_genre
      genre.add_item(music)
      @music_albums << music
      save_genre
    end
  end

  def list_music_albums
    puts 'Empty List: No music albums found' if @genres.empty?
    @genres.each_with_index do |genre, index|
      genre.items.each do |item|
        puts "#{index}=> Name: '#{genre.name}', On spotify: '#{item.on_spotify}', Date : '#{item.publish_date}'"
      end
    end
  end

  def list_genres
    puts 'Empty List: No genres found' if @genres.empty?
    @genres.each_with_index do |genre, index|
      puts "#{index}=> Genre Name: '#{genre.name}', Genre ID: '#{genre.id}'"
    end
  end
end
