require 'spec_helper'

describe CategoriesController do

  describe '#index' do
    it 'should get me all categories' do
      get(:index)
      expect(assigns(:categories).count).to eq Category.count
    end
  end

  describe '#show' do
    let!(:category) { FactoryGirl.create(:category) }
    let!(:posts) { Array.new(3).map{  FactoryGirl.create(:post, category: category) } }

    it 'should get me the category' do
      get(:show, id: category.id)
      expect(assigns(:category).name).to eq category.name
    end

    it 'should get me the categories posts' do
      get(:show, id: category.id)
      expect(assigns(:posts).count).to eq posts.count
    end
  end
end
