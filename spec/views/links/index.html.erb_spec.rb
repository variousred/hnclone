require 'spec_helper'

describe "links/index.html.erb" do
  context "voting on links" do
    before do
      assign(:link, Link.new)
      render
    end  

    it 'has a vote button' do
      rendered.should have_tag('form', :with => { :action => "/votes", :method => 'post' }) do
        with_tag "input", :with => { :name => "vote[link_id]"}
      end
    end
  end
end
