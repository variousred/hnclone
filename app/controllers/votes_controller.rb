class VotesController < ApplicationController
  def create
    link = Link.find(params[:vote][:link_id])
    link.votes.create  # created Vote obj, with link_id automatically set
    redirect_to links_path
  end
end
