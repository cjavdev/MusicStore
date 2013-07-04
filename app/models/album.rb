class Album < ActiveRecord::Base
  attr_accessible :recorded_live, :title, :band_id
  
  validates :title,:band_id, :presence => true
  
  belongs_to :band
  has_many :tracks, :dependent => :destroy
end
