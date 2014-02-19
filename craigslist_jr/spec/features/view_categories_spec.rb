require 'spec_helper'

describe "view categories", :js => true do

  context "view homepage" do
    let!(:category) { FactoryGirl.create(:category) }
    before :each do
      visit root_path
    end

    it 'should take me to home page' do
      expect(page).to have_content("Patrickslist")
    end

    it 'should show categories' do
      expect(page).to have_content(category.name)
    end

    describe "click on a category" do
      let!(:posts) { Array.new(10).map{ |m| FactoryGirl.create(:post, category: category)} }
      before :each do
        click_link category.name
      end

      it 'should take me to a page' do
        expect(page).to have_content category.name
      end

      it 'should show me posts of the category' do
        posts.each do |p|
          expect(page).to have_content p.title
        end
      end
    end
  end
end