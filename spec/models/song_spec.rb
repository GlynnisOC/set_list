require "rails_helper"

RSpec.describe Song, type: :model do
  describe "relationship" do
    it {should belong_to :artist}
    it {should have_many :playlist_songs}
    it {should have_many(:playlists).through(:playlist_songs)}
    it {should have_many :award_songs}
    it {should have_many(:awards).through(:award_songs)}
  end

  describe 'class methods' do
    it '.song_count' do
      prince = Artist.create!(name: 'Prince')
      talking_heads = Artist.create!(name: 'Talking Heads')
      raspberry_beret = prince.songs.create(title: 'Raspberry Beret')
      wild_life = talking_heads.songs.create(title: 'Wild Wild Life')

      expect(Song.song_count).to eq(2)
    end
  end
end
