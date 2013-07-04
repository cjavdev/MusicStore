class Artist < ActiveRecord::Base
  attr_accessible :name
  
  validates :name, :presence => true
  
  has_many :band_memberships
  has_many :bands, :through => :band_memberships, :source => :band
end
