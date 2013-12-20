require 'spec_helper'

describe "the signup process" do

  it "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Sign Up"
  end

  describe "signing up a user" do

    it "shows username on the homepage after signup" do
      visit new_user_url
      fill_in "username", :with => "testing_username"
      fill_in "password", :with => "password"
      click_on "Sign Up"

      expect(page).to have_content "testing_username"
    end

  end

end

describe "logging in" do

  it "shows username on the homepage after login"

end

describe "logging out" do

  it "begins with logged out state"

  it "doesn't show username on the homepage after logout"

end