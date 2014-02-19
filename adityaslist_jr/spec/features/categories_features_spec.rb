require 'spec_helper'

describe "Categories Flow", js: true do
  describe "home categories page" do
    it 'should show me all categories on homepage' do
      visit root_path
      expect(page).to have_content "Category 1"
    end
  end
end