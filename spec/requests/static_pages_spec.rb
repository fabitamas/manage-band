require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
  	it "should have the title 'Home | Manage Band'" do
      visit '/static_pages/home'
      page.should have_selector('title', text: 'Home | Manage Band', visible: false)
    end

    it "should have the content 'Welcome'" do
      visit '/static_pages/home'
      page.should have_content('Welcome')
    end

    it "should have the content 'Manage Band'" do
      visit '/static_pages/home'
      page.should have_content('Manage Band')
    end

  end

  describe "Help page" do
  	it "should have the title 'Help | Manage Band'" do
      visit '/static_pages/help'
      page.should have_selector('title', text: 'Help | Manage Band', visible: false)
    end

    it "should have the content 'FAQ'" do
      visit '/static_pages/help'
      page.should have_content('FAQ')
    end
  end

  describe "About page" do
  	it "should have the title 'About | Manage Band'" do
      visit '/static_pages/about'
      page.should have_selector('title', text: 'About | Manage Band', visible: false)
    end

    it "should have the content 'About us'" do
      visit '/static_pages/about'
      page.should have_content('About us')
    end
  end
end
