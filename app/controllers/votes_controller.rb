class VotesController < ApplicationController
  def create
    link = Link.find(params[:link_id])
    link.votes.create
    redirect_to links_path
  end
end
