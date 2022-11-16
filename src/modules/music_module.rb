require_relative '../classes/genre'

module MusicModule
    def create_music
        puts 'Is the Music Album you want to create on spotify? [y/n]: '
        on_sportify = gets.chomp
        case on_sportify
        when 'y'
        on_sportify = true
        when 'n'
        on_sportify = false
        end
        puts 'Enter the date it was published in this format (YYYY-MM-DD): '
        publish_date = gets.chomp

        MusicAlbum.new(on_sportify, publish_date)
    end

    def add_new_genre
        puts 'Enter name of genre: '
        name = gets.chomp
        Genre.new(name)
    end

    def add_existing_genre
        puts 'Select ID of genre: '
        genre_id = gets.chomp.to_i
        @genres.find { |genre| genre.id == genre_id }
    end
end