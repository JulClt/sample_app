require 'spec_helper'

describe "LayoutLinks" do
  describe "GET /" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get root_path
      response.status.should be(200)
    end
  end

  describe "GET /contact" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get contact_path
      response.status.should be(200)
    end
  end

  describe "GET /about" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get about_path
      response.status.should be(200)
    end
  end

  describe "GET /help" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get help_path
      response.status.should be(200)
    end
  end

  describe "GET /signup" do
    it "shoud be works" do
      get "/signup"
      response.status.should be(200)
    end
  end
end
