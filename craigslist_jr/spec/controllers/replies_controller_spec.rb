require 'spec_helper'

describe RepliesController do

  context '#new' do
    let(:post) {FactoryGirl.create(:post)}
    it "should initalize an empty reply" do
      get(:new, {post_id: post.id})
      expect(assigns(:reply).id).to be_nil
    end
  end

end
