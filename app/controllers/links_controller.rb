class LinksController < ApplicationController
  def index
    @links = Link.by_votes.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(params[:link])
    
    if @link.save
      redirect_to links_path, :notice => "Link added"
    else
      render "new"
    end
  end
end
