require 'spec_helper'

describe "Static pages" do


  describe "Home page" do
    it "should have the h1 'Collaborist'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Collaborist')
    end 
    it "should have the title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => "Collaborist | Home")
    end
  end
  
  
  describe "Help page" do 
  	it "should have the h1 'Any Questions?'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Any Questions?')
    end
    it "should have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title', :text => "Collaborist | Help")
    end
  end

  
  describe "About Page" do 
  	it "should have the h1 'About Collaborist'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About Collaborist')
    end
    it "should have the title 'About'" do
      visit '/static_pages/about'
      page.should have_selector('title', :text => "Collaborist | About")
    end
  end
end