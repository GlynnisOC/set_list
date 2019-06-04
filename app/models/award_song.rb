class AwardSong < ApplicationRecord
  belongs_to :song
  belongs_to :award
end
