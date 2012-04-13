require 'spec_helper'

describe Link do
  
  it 'requires a url' do
    should_not be_valid
    subject.errors[:url].should_not be_empty
  end
  
  it 'requires a title' do
    should_not be_valid
    subject.errors[:title].should_not be_empty
  end
  
  it 'does not allow duplicate urls' do
    Link.create! :title => "dont care", :url => "http://devbootcamp.com"
    l = Link.new :title => "dont care", :url => "http://devbootcamp.com"
    l.should_not be_valid
    l.errors[:url].should_not be_empty
  end
  
  it 'has a valid url' do
    l = Link.new :title => "dont care", :url => "123456"
    l.should_not be_valid
  end
  
  context "with votes" do
    before(:each) do
      @link = Link.create :title => "dont care", :url => "http://google.com"
    end
    
    it "has a number of votes" do
      @link.votes.count.should be_zero
      @link.votes.count.should == 0
    end

    it 'can be upvoted' do
      expect {
        @link.votes.create
      }.to change{@link.votes.count}.by(1)

    end
    
    it "can be sorted by vote count" do
      link1 = FactoryGirl.create(:link_with_5_votes)
      link2 = FactoryGirl.create(:link_with_10_votes)
      link3 = FactoryGirl.create(:link_with_8_votes)

      Link.by_votes.should == [link2, link1, link3]
    end
    
  
  end
end
