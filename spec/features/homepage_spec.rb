require 'spec_helper'



describe "Homepage", :js => true do
  context "when user visits the homepage" do
    it "displays a welcome heading" do
      visit root_path
      expect(page).to have_content('Welcome to Browntown Reddit')
    end
  end

  context "when user clicks on sign up from the homepage" do
    it "should display the sign up page" do
      visit signup_path
      expect(page).to have_content("Sign Up")
      current_path.should eq(signup_path)
    end
  end

end

describe "Sign Up Page", :js => true do
  context "user can submit sign up form" do
    it "should take user to user profile page" do
      visit signup_path
      fill_in 'Name', with: "bob"
      fill_in 'Email', with: "bob@example.com"
      fill_in 'user_password', with: "bobpassword"
      click_button 'Sign Up'
      current_path.should eq(user_path(User.last))
    end
  end

end

describe "Create Wall Form" do
  it "allows a user to create a wall" do
    user = User.create :email => "bob@example.com", :password => 'bobpassword'

    login(user)
    expect(page).to have_content("Welcome #{user.name}")
    p page
    # visit new_wall_path
    # expect(page).to have_content("Create a Wall")

  end
end

# describe "Clear out the database" do
#     after(:all) do
#       User.destroy_all
#       Post.destroy_all
#       Vote.destroy_all
#       Comment.destroy_all
#     end
# end

def login(user)
  visit signin_path
  fill_in 'Email', with: user.email
  fill_in 'session_password', with: user.password
  click_button 'Sign In'
end

