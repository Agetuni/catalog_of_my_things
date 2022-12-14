require_relative '../src/classes/genre'
require_relative '../src/classes/item'

describe Genre do
  before :all do
    @genre = Genre.new('Classic')
  end

  describe 'for a new genre created' do
    it 'should return an instance of Genre' do
      expect(@genre).to be_an_instance_of(Genre)
    end
  end

  describe 'testing for genre name' do
    it 'should return Classic genre name' do
      expect(@genre.name).to eq 'Classic'
    end
  end

  describe 'adding items' do
    it 'adding items' do
      item = Item.new('2022-03-16')
      @genre.add_item(item)
      expect(@genre.items).to include(item)
    end
  end
end
