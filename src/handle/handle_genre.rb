require_relative 'helper_methods'
require_relative '../modules/music_module'

module HandleGenre
  include HelperMethods
  include MusicModule

  # MUSIC
  def save_genre
    array = []
    @genres.each do |genre|
      array << {
        genre_id: genre.id,
        name: genre.name,
        Items: genre.items.map do |item|
                 {
                   on_spotify: item.on_spotify,
                   publish_date: item.publish_date
                 }
               end
      }
    end
    write_json(array, './JSONdata/genres.json')
  end

  def load_genres
    parse_file = read_json('./JSONdata/genres.json')
    parse_file.each do |genre|
      new_genre = Genre.new(genre['name'])
      @genres << new_genre
      genre['Items'].each do |item|
        new_genre.add_item(MusicAlbum.new(item['on_spotify'], item['publish_date']))
      end
    end
  end
end