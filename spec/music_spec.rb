require_relative '../src/classes/musicalbum'
require_relative '../src/classes/item'

describe MusicAlbum do
  before :each do
    @music = MusicAlbum.new(true, '2045-02-02')
  end

  describe '#new' do
    it 'creates an instance of the music album class' do
      @music.should(be_an_instance_of(MusicAlbum))
    end
  end

  it 'should return true on having album on_spotify ' do
    on_spotify = true
    expect(on_spotify).to be true
  end

  it 'should return true when calling the can_be_archived? method' do
    expect(@music.can_be_archived?).to be true
  end
end
