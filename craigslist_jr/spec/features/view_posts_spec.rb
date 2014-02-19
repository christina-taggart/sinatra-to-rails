require 'spec_helper'

describe "view posts", :js => true do

  context "view post page" do
    let!(:post) {FactoryGirl.create(:post)}
    before :each do
      visit category_post_path(post.category_id, post)
    end

    it "should have content about each post (title, price)" do
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.price)
    end
  end

  context "create a post" do
    let!(:category) { FactoryGirl.create(:category) }
    before :each do
      visit category_path(category)
    end

    it 'category page should have new post link' do
      expect(page).to have_link("Create a Post")
    end

    describe 'click on a post' do
      before :each do
        # binding.pry
        click_link "Create a Post", :match => :first
      end

      it 'should take me to a page' do
        expect(page).to have_content "Create a new post"
      end

      it 'should have a form' do
        expect(page).to have_selector('form')
        expect(page).to have_selector('#post_title')
        expect(page).to have_selector('#post_body')
        expect(page).to have_selector('#post_price')
      end
    end
  end
end
