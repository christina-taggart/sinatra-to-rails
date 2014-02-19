require 'spec_helper'

describe Post do
  it { should belong_to :category }
  it { should validate_presence_of :body }
  it { should validate_presence_of :title }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
end