require 'spec_helper'

describe Article do
  before(:each) do
    @article = Article.new(:title => "Hello, World", 
                           :body => "Sample Body.")
  end
  
  let(:article){ Fabricate(:article) }

  it "is not valid without a title" do
    @article.title = nil
    @article.should_not be_valid
  end

  it "is not valid without a body" do
    @article.body = nil
    @article.should_not be_valid
  end

  it "must have a unique title" do
    @article.save
    second = @article.clone
    second.should_not be_valid
  end

  it "should return the title when converted to a string" do
    @article.to_s.should == @article.title
  end

  it "should respond to comments" do
    @article.should respond_to(:comments)
  end

  it "should respond to .valid_ids with a set of all current article IDs" do
    Article.valid_ids.should == Article.select(:id).collect{|a| a.id}
  end
  
  context "#to_leaf" do
    it "should contain the title" do
      article.to_leaf.should include(article.title)
    end
  end
  
  context "#to_tree" do
    it "should contain itself and all comments" do
      c = Fabricate(:comment)
      c.comments << Fabricate(:comment)
      article.comments << c
      output = article.to_tree
      output.should include(article.to_leaf)
      article.comments.each do |comment|
        output.should include(comment.to_leaf)
      end
    end
  end
end
