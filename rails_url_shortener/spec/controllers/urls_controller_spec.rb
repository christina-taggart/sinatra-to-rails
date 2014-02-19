require 'spec_helper'

describe UrlsController do
  context '#index' do
    it "assigns @url to be a Url object" do
      get :index
      expect(assigns(:url)).to be_a(Url)
    end

    it "assigns @url to be unsaved" do
      get :index
      expect(assigns(:url).id).to be_nil
    end
  end
end