class Link < ActiveRecord::Base
  validates :url, :presence => true, :uniqueness => true, :format => {:with => URI.regexp}
  validates :title, :presence => true

  has_many :votes

  scope :desc, order('created_at DESC')
  scope :by_votes, joins(:votes).group(:link_id).order("count(link_id) DESC").select("links.*, count(link_id) as vote_count")

end
