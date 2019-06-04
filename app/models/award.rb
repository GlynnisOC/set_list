class Award < ApplicationRecord
  has_many :award_songs
  has_many :songs, through: :award_songs
end
