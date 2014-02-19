require 'spec_helper'

describe PostsController do


  let(:new_post) { FactoryGirl.create(:post) }

  context '#show' do
    it "should assign @post to a single post" do
      get(:show,  { category_id: new_post.category.id,  id: new_post.id })
      expect(assigns(:post).id).to eq new_post.id
    end
  end

  context '#new' do
    it "should initialize an empty post" do
      get(:new, { category_id: new_post.category_id })
      expect(assigns(:post).id).to be_nil
    end
  end

  context '#create' do
    let(:category) { FactoryGirl.create(:category) }

    it "should create a new post" do
      expect {
        post(:create, {category_id: category.id, post: {title: "my title", body: "my body"}} )
      }.to change{Post.count}.by(1)
      expect(assigns(:post).title).to eq Post.last.title
    end
  end

  context '#edit' do
    it "should assign @post to an existing post" do
      get(:edit, { category_id: new_post.category.id,  id: new_post.id })
      expect(assigns(:post)).to eq new_post
    end
  end

  context '#update' do
    it "should update a post" do
      put(:update, {category_id: new_post.category_id, id: new_post.id, post: {title: "new title", body: new_post.body}})
      new_post.reload
      expect(new_post.title).to eq "new title"
    end
  end

  context '#destroy' do
    it "should destroy a post" do
      new_post.save
      expect {
        delete(:destroy, {category_id: new_post.category_id, id: new_post.id} )
      }.to change{Post.count}.by(-1)
      expect(Post.where(id: new_post.id)).to be_empty
    end
  end
end