require 'spec_helper'
require 'capybara/rspec'

describe "articles#show" do
  let!(:article){ Fabricate(:article) }

  before(:each) do
    visit article_path(article)
  end

  it "has the title in H1 tags" do
    page.should have_selector("h1", :text => article.title)
  end
    
  it "has an edit link" do
    page.should have_link("edit")
  end
  
  it "goes to the edit form when you click the edit link" do
    click_on("edit")
    current_path.should == edit_article_path(article)
  end

  context "delete link" do
    it "exists" do
      page.should have_link(dom_id(article, :delete))
    end
    
    # it "pops up a confirmation dialog", :js => true do
    #   pending
    #   page.click_link(dom_id(article, :delete))
    #   dialog = page.driver.browser.switch_to.alert
    #   dialog.text.downcase.should include("delete")
    #   dialog.dismiss
    # end
    # 
    # it "deletes the article when confirmed", :js => true do
    #   pending
    #   page.click_link(dom_id(article, :delete))
    #   dialog = page.driver.browser.switch_to.alert
    #   dialog.text.downcase.should include("delete")
    #   dialog.confirm
    #   current_path.should == articles_path
    #   page.should_not have_link(dom_id(article))
    # end
  end
end