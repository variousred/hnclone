require 'spec_helper'

describe LinksController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    context "when saving successfully" do
      it 'redirects to index' do
        post :create, :link => {:url => 'http://devbootcamp.com', :title => 'Yeah!'}
        response.should redirect_to(links_path)
      end
      it 'gives a "success" message' do
        post :create, :link => {:url => 'http://devbootcamp.com', :title => 'Yeah!'}
        flash[:notice].should == 'Link added'
      end
      it 'saves the link' do
        expect {
          post :create, :link => {:url => 'http://devbootcamp.com', :title => 'Yeah!'}
        }.to change(Link, :count).by(1)
      end
    end
    context "when saving fails" do
      it 'renders the "new" template'
      it 'does not save the link'
    end

  end

end
