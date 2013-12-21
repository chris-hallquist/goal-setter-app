require 'spec_helper'

describe Cheer do


  it "user can give cheer" do
    u = FactoryGirl.create(:user)
    g = FactoryGirl.create(:goal, :user_id => u.id)

    visit new_session_url
    fill_in "username", :with => "alice"
    fill_in "password", :with => "password"
    click_on "Sign In"

    visit goal_url(g)
    click_on "Give Cheer"

    expect(Cheer.find_by_user_id_and_goal_id(u.id, g.id)).not_to be_nil
  end



  it "user cannot give more than 1 cheers" do
    u = FactoryGirl.create(:user)
    g = FactoryGirl.create(:goal, :user_id => u.id)

    visit new_session_url
    fill_in "username", :with => "alice"
    fill_in "password", :with => "password"
    click_on "Sign In"

    visit goal_url(g)
    click_on "Give Cheer"
    click_on "Give Cheer"
    expect(page).to have_content("Cannot give more than 1 cheer")

  end


end
