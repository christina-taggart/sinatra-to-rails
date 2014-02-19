require 'spec_helper'

describe UrlsController do
  before do
    @url = Url.create(original_url: 'www.google.com')
  end
  context "when index loads correctly" do
    it "has a new URL object" do
      get :index
      response.should be_ok
    end
  end

  context "url#create" do
    it "saves the entered URL to the db" do
      expect{
        post :create, :url => {:original_url => "google.com"}
        }.to change{Url.count}.by(1)
    end
  end

  context "url#show" do
    it "finds a URL object based on params" do
      get :show, id: @url
      p @url
      assigns(:url).id.should eq(@url.id)
    end
  end
end