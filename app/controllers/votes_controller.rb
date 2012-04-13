class VotesController < ApplicationController
  before_filter :voted?

  def create
    link = Link.find(params[:vote][:link_id])
    link.votes.create  # created Vote obj, with link_id automatically set
    cookies[:voted] = "true"
    redirect_to links_path
  end

private

  def voted?
    redirect_to(links_path, alert: "You cant vote more than once per Link") if cookies[:voted]
  end
end
