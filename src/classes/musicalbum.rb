require_relative 'item'

class MuicAlbum < Item
  attr_accessor :on_spotify

  def initialize
    super()
    @on_spotify = on_spotify
  end

  def can_be_archived?
    on_spotify == true
  end
end
