require 'spec_helper'
require 'capybara/rspec'

describe "the articles interface" do
  before(:all) do
    @articles = []
    3.times{ @articles << Fabricate(:article) }
  end
  
  describe "on the index page" do
    before(:each) do
      visit articles_path
    end
    
    it "should list the article titles" do
      @articles.each do |article|
        page.should have_content(article.title)
      end
    end

    it "should have links for the articles" do
      @articles.each do |article|
        page.should have_link(article.title, :href => article_path(article))
      end
    end    
  end
end