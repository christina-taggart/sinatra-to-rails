require 'spec_helper'

describe Post do
  specify { expect(subject).to belong_to :category }
end
