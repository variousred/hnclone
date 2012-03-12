require 'spec_helper'

describe Vote do
  it "must belong to a link" do
    v = Vote.new
    v.should_not be_valid
    v.errors[:link].grep(/can't be blank/).should_not be_empty
  end
end
