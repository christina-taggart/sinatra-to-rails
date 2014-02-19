require 'spec_helper'

describe "homepage" do
  let(:long_url) { "http://www.google.com" }
  let!(:url) { Url.create :long_url => long_url }
  let(:short_url) { url.short_url }
  context "list of urls" do
    before :each do
      visit root_path
    end
    it "displays the long urls" do
      expect(page).to have_content long_url
    end
    it "displays the short urls" do
      expect(page).to have_content short_url
    end
  end
  context "displaying user input on homepage" do
    before :each do
      visit root_path
      fill_in "url[long_url]", :with => long_url
      click_on "Create Url"
    end
    it "appends the long url that the user typed in to the page" do
      expect(page).to have_content long_url
    end
    it "appends the short url that is created from the long url to the page" do
      expect(page).to have_content short_url
    end
  end
  context "redirecting to long_url from short_url" do
    it "redirects upon clicking short_url to long_url" do
      visit root_path
      click_on url.short_url
      expect(page.current_url).to eq url.long_url + "/"
    end
  end
end