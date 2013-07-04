class Track < ActiveRecord::Base
  attr_accessible :album_id, :is_bonus, :lyrics, :title

  belongs_to :album

  has_one :band, :through=>:album, :source=>:band
  has_many :notes, :dependent => :destroy
end
