# rubocop:disable Lint/EmptyClass
require_relative 'item'

class MuicAlbum < Item
    attr_accessor :on_spotify
    def initialize
        @on_spotify=on_spotify
    end

end
# rubocop:enable Lint/EmptyClass
