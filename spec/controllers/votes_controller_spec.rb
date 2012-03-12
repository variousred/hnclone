require 'spec_helper'

describe VotesController do

  describe "POST 'create'" do
    before do
      @link = FactoryGirl.create(:link)
    end

    it "redirects to index of lists" do
      post :create, :vote => {:link_id => @link.id}
      response.should redirect_to links_path
    end
    
    it "it should increase the vote_count of a link" do
      expect {
        post :create, :vote => {:link_id => @link.id}
      }.to change(@link, :vote_count).by(1)
    end
    
    it "should throw a 404 if the link id is unkown" do
      expect {
        post :create, :vote => {:link_id => 1234556788}
      }.to raise_exception(ActiveRecord::RecordNotFound)
      
    end
  end

end
