require 'spec_helper'

describe Url do
  it { should allow_mass_assignment_of(:original_url) }
  it { should validate_uniqueness_of(:url_digest) }
  it { should allow_value('www.google.com', 'http://www.google.com', 'https://www.google.com', 'google.com').for(:original_url) }
  it { should_not allow_value('google', 'google,com').for(:original_url) }

end