require 'spec_helper'

describe User do
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:password_hash)}
  it {should have_many(:posts)}
  it {should have_many(:comments)}
  it {should have_many(:votes)}



end