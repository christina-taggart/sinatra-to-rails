require 'spec_helper'

describe PostsController do
  context "User can create a post" do
    before do
      user = sign_in_as user
      p user
    end
  end
end