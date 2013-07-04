class Song < ActiveRecord::Base
  attr_accessible :original_lyrics, :title
  
  validates :title, :presence => true
  
  has_many :tracks
end
