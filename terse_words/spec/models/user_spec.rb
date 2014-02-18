require 'spec_helper'

describe User do
  let(:john) { User.new() }
  it { should have_many(:urls) }

  it "should set the password hash" do
    john.password = "qwerty"
    expect(john.password_hash).not_to eq nil
    expect(john.password).to eq "qwerty"
  end
end