require 'spec_helper'

describe Url do
  let(:url) { Url.new(long_url: "http://devbootcamp.com") }

  it {should belong_to(:user)}
  it { should validate_uniqueness_of(:short_url)}

  it "should generate short_url before save" do
    url.save
    expect(url.short_url).not_to eq nil
  end
end