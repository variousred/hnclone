require 'spec_helper'

describe 'links/new' do
  before do
    assign(:link, Link.new)
    render
  end  

  it 'has a form posting to /links' do
    rendered.should have_tag('form', :with => { :action => "/links", :method => 'post' }) do
      with_tag "input", :with => { :name => "link[url]"}
      with_tag "input", :with => { :name => "link[title]"}
    end
  end
end
