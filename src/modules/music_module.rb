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
end