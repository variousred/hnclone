class LinksController < ApplicationController
  def index
  end

  def new
    
  end

  def create
    Link.create(params[:link])
    redirect_to links_path, :notice => "Link added"
  end
end
