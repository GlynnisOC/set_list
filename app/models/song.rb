class Song < ApplicationRecord
  belongs_to :artist
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs
  has_many :award_songs
  has_many :awards, through: :award_songs

  def self.song_count
    count
  end
end
