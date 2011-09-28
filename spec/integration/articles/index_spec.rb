require 'spec_helper'
require 'capybara/rspec'

describe "articles#index" do
  let!(:articles){ (0...3).collect{ Fabricate(:article)} }
  let!(:article){ articles.first }

  before(:each) do
    visit articles_path
  end
  
  it "should have a link to article" do
    page.should have_link(dom_id(article))
  end
  
  it "should go to the article page when I click the link" do
    page.click_on(dom_id(article))
    current_path.should == article_path(article)
  end
  
  it "should list the article titles" do 
    articles.each do |article|
      page.should have_content(article.title)
    end
  end
  
  it "should have a link to each article" do
    articles.each do |article|
      page.should have_link(dom_id(article))
    end
  end
  
  it "should have a new article link" do
    page.should have_link("new_article")
  end
  
  it "is available through selenium", :js => true do
    page.should have_content("All Articles")
  end
end