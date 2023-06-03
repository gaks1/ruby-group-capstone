require_relative '../music_album'

describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new(true, Date.parse('2010-01-02'))
  end

  context 'When testing the MusicAlbum class' do
    it 'Should create an instance of the class' do
      expect(@music_album).to be_an_instance_of(MusicAlbum)
    end

    it 'Should allow the music album to be archived' do
      expect(@music_album.can_be_archived?).to be_truthy
    end
  end
end
