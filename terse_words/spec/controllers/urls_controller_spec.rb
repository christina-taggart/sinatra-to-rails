require 'spec_helper'

describe UrlsController do
  let(:user) { FactoryGirl.create :user }

  # Logged in
  context "logged in" do
    context "#index" do
      before(:each) do
        controller.stub(:current_user => user )
      end
      it "should assign @user" do
        get :index, user_id: user.id
        expect(assigns(:user)).to be_present
      end
      it "should assign @urls" do
        get :index, user_id: user.id
        expect(assigns(:urls).class).to eq Array
      end
    end

    context "#show" do
      let(:url) { FactoryGirl.create :url }
      before(:each) do
        controller.stub(:current_user => user )
        controller.stub(:check_authorization => true )
      end
      it "should assign url" do
        get :show, user_id: user.id, id: url.id
        expect(assigns(:url)).to eq url
      end
    end

    context "#new" do
      before(:each) do
        controller.stub(:current_user => user )
      end
      it "should assign a new url" do
        get :new, user_id: user.id
        expect(assigns(:url)).to be_a_new(Url)
      end
    end

    context "#destroy" do
      let!(:url) { FactoryGirl.create :url }
      before(:each) do
        controller.stub(:current_user => user )
        controller.stub(:check_authorization => true )
      end
      it "should destroy the url" do
        expect {
          delete :destroy, user_id: user.id, id: url.id
          }.to change { Url.count }.by(-1)
      end
    end

    context "#create" do
      before(:each) do
        controller.stub(:current_user => user )
      end
      it "creates a url" do
        expect {
          post :create, user_id: user.id, post: FactoryGirl.attributes_for(:url)
        }.to change { Url.count }.by(1)
      end
    end
  end

  # Not logged in
  context "not logged in" do
    context "#index" do
      it "should redirect" do
        get :index, user_id: user.id
        expect(response).to be_redirect
      end
    end

    context "#show" do
      let(:url) { FactoryGirl.create :url }
      it "should redirect" do
        get :show, user_id: user.id, id: url.id
        expect(response).to be_redirect
      end
    end

    context "#new" do
      it "should redirect" do
        get :new, user_id: user.id
        expect(response).to be_redirect
      end
    end

    context "#destroy" do
      let!(:url) { FactoryGirl.create :url }
      it "should redirect" do
        get :destroy, user_id: user.id, id: url.id
        expect(response).to be_redirect
      end
    end

    context "#create" do
      it "should redirect" do
        get :create, user_id: user.id
        expect(response).to be_redirect
      end
    end
  end
end