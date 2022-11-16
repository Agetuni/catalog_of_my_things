require_relative 'musicalbum'

class Genre
  attr_accessor :name, :items, :id

  def initialize(name)
    @id = rand(1..100)
    @name = name
    @items = []
  end

  def add_item(music)
    @items.push(music)
    music.genre = self
  end
end