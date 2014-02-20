require 'spec_helper'

describe "Categories Flow", js: true do
  describe "home categories page" do
    let!(:category) { FactoryGirl.create(:category) }
    before :each do
      visit root_path
    end

    it 'should have a link to view posts for each category' do
      expect(page).to have_link category.name
    end

    describe "Clicking on a category link" do
      let!(:posts) { Array.new(10).map{ FactoryGirl.create(:post, category: category) } }
      before :each do
        click_link category.name
      end

      it 'should show the category name' do
        expect(page).to have_content category.name
      end

      it 'should show link to posts associated by the category' do
        posts.each do |p|
          expect(page).to have_link(p.title)
        end
      end
    end
  end
end