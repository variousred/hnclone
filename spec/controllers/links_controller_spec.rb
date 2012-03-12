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
      let(:successful_params) do 
        {:link => {:url => 'http://devbootcamp.com', :title => 'Yeah!'}}
      end
      
      it 'redirects to index' do
        post :create, successful_params
        response.should redirect_to(links_path)
      end
      it 'gives a "success" message' do
        post :create, successful_params
        flash[:notice].should == 'Link added'
      end
      it 'saves the link' do
        expect {
          post :create, successful_params
        }.to change(Link, :count).by(1)
      end
    end

    context "when saving fails" do
      let(:failing_params) do
         {:link => {:url => '', :title => ''}} 
      end
      
      it 'renders the "new" template' do
        post :create, failing_params
        response.should be_success
        response.should render_template('new')        
      end
      
      it 'does not save the link' do 
        expect {
          post :create, failing_params
        }.to_not change(Link, :count)
      end
    end

  end

end
