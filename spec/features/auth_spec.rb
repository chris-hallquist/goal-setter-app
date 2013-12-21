require 'spec_helper'

describe "the signup process" do
  before :each do
    visit new_user_url
  end

  it "has a new user page" do
    expect(page).to have_content "Sign Up"
  end

  describe "signing up a user" do

    it "shows username on the homepage after signup" do
      fill_in "username", :with => "testing_username"
      fill_in "password", :with => "password"
      click_on "Sign Up"

      expect(page).to have_content "testing_username"
    end

  end

end

describe "logging in" do

  it "shows username on the homepage after login" do
    FactoryGirl.create(:user)

    visit new_session_url
    fill_in "username", :with => "alice"
    fill_in "password", :with => "password"
    click_on "Sign In"

    expect(page).to have_content "alice"

  end

end

describe "logging out" do
  let(:user) {FactoryGirl.create(:user)}

  it "begins with logged out state" do
    visit user_url(user)
    expect(page).to have_content "Sign In"
  end

  it "doesn't show username on the homepage after logout" do
    FactoryGirl.create(:user)

    visit new_session_url
    fill_in "username", :with => "alice"
    fill_in "password", :with => "password"
    click_on "Sign In"
    click_on "Sign Out"

    expect(page).not_to have_content "alice"
  end

end