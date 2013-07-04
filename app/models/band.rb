class Band < ActiveRecord::Base
  attr_accessible :name
  
  validates :name, :presence => true
  
  has_many :albums, :dependent => :destroy
  has_many :tracks, :through=>:albums, :source=>:tracks
  
  has_many :band_memberships
  has_many :band_members, :through => :band_memberships, :source => :artist
end
