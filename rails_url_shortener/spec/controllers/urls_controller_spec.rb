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
  context '#create' do
    it "renders new view on failure to save" do
      Url.any_instance.stub(:save => false)
      post :create, url: { long_url: "some_url" }
      expect(response).to render_template(:new)
    end
    it "renders create on a successful save" do
      Url.any_instance.stub(:save => true)
      post :create, url: { long_url: "some_url" }
      expect(response).to render_template(:create)
    end
  end
  context '#show' do
    it "redirects to long url when params[:short_url]" do
      get :show
      expect(response).to be_redirect
    end
  end
end