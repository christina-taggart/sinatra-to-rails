require 'spec_helper'

describe Url do
  it { should validate_uniqueness_of :long_url }
  it "should automatically create the short code" do
    url = Url.new(long_url: "http://www.google.com")
    url.save
    expect(url.short_url).not_to be_nil
  end
end