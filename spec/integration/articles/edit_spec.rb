require 'spec_helper'

describe "articles#edit" do
  let!(:article){ Fabricate(:article) }

  before(:each) do
    visit edit_article_path(article)
  end
  
  context "clicking SUBMIT" do
    it "goes to articles#show" do
      click_on("article_submit")
      current_path.should == article_path(article)
    end
  end
end
