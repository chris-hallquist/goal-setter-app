require 'spec_helper'

describe Cheer do
  let(:u) { FactoryGirl.create(:user) }
  let(:g) { FactoryGirl.create(:goal, :user_id => u.id) }

  before :each do
    u
    g

    visit new_session_url
    fill_in "username", :with => "alice"
    fill_in "password", :with => "password"
    click_on "Sign In"

    visit goal_url(g)
    click_on "Give Cheer"
  end

  it "user can give cheer" do
    expect(Cheer.find_by_user_id_and_goal_id(u.id, g.id)).not_to be_nil
  end



  it "user cannot give more than 1 cheers" do
    click_on "Give Cheer"
    expect(page).to have_content("Cannot give more than 1 cheer")

  end


end
