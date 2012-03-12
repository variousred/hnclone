require 'spec_helper'

describe "links/index.html.erb" do
  context "voting on links" do
    
    before do
      @links = [Factory(:link)]
      assign(:links, @links)  # :links --> @links in view
      render
    end  

    it 'has a vote button' do
      rendered.should have_tag('form', :with => { :action => "/votes", :method => 'post' }) do
        with_tag "input",
          :with => { :name => "vote[link_id]", :value => @links[0].id}
      end
    end
  end
end
