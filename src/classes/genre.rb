# rubocop:disable Lint/EmptyClass
class Genre
    attr_reader :name, :item
    def initialize(name, item)
        @id = rand(1..100)
        @name = name
        @item = []
    end
end
# rubocop:enable Lint/EmptyClass
