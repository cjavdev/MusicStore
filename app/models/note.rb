class Note < ActiveRecord::Base
  attr_accessible :body, :track_id, :user_id
  
  belongs_to :author, :class_name=>"User",:foreign_key=>:user_id
  belongs_to :track
end
