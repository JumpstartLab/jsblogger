require 'spec_helper'

describe Comment do
  let(:comment){ Fabricate(:comment) }
  
  it "should be valid with valid attributes" do
    comment.should be_valid
  end

  it "should have a subject" do
    comment.should respond_to(:subject)
  end
  
  context "when attached to an article" do
    let(:article) { Fabricate(:article) }
    
    it "can find the article" do
      c = Fabricate(:comment, :subject => article)
      c.subject.should == article
    end
    
    it "can be found by the article" do      
      article.comments.count.should == 0
      article.comments << comment
      article.comments.count.should == 1
    end
  end
  
  context "when attached to a comment" do
    it "can hook to a second comment" do
      parent = Fabricate(:comment)
      parent.comments.count.should == 0
      parent.comments << comment
      parent.comments.count.should == 1
    end
    
    context "#to_tree" do
      it "should show one nested comment" do
        comment.comments << Fabricate(:comment)
        comment.to_tree.scan(/-\s/).count.should == 2
      end
      
      it "should indent the child comment" do
        comment.comments << Fabricate(:comment)
        comment.to_tree.should match(/\n\s\s-\s/)
      end
    end
  end
  
  context "#to_leaf" do
    it "should generate a string with a leading hyphen" do
      comment.to_leaf.should match(/-\s/)
    end
    
    it "should prefix with 2x the number of spaces passed in" do
      comment.to_leaf(4).should match(/^\s{8}-\s/)
    end
  end
end
