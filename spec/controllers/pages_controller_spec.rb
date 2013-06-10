require 'spec_helper'

describe PagesController do

  render_views

  before(:each) do
    @basic_title = "Mon tutoriel Ruby On Rails"
  end

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end

    it "should have a title" do
      get 'home'
      response.should have_selector("title", :content => @basic_title + " | Accueil")
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end

    it "should have a title" do
      get 'contact'
      response.should have_selector("title", :content => "Mon tutoriel Ruby On Rails | Contact")
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end

    it "should have a title" do
      get 'about'
      response.should have_selector("title", :content => @basic_title + " | A propos")
    end
  end

  describe "GET 'help'" do
    it "should be successful" do
      get 'help'
      response.should be_success
    end

    it "should have a title" do
      get 'help'
      response.should have_selector("title", :content => @basic_title + " | Aide")
    end
  end
end
