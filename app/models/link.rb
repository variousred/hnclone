class Link < ActiveRecord::Base
  validates :url, :presence => true, :uniqueness => true, :format => {:with => URI.regexp}
  validates :title, :presence => true
  
end
