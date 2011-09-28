require 'spec_helper'

describe Comment do
  let(:comment){ Fabricate(:comment) }
  
  it "should be valid with valid attributes" do
    comment.should be_valid
  end


end
