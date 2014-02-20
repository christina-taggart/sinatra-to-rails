require 'spec_helper'

describe Category do
  specify { expect(subject).to have_many :posts }
end