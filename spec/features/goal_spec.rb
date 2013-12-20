require 'spec_helper'

describe Goal do
    let(:user) {User.find(1)}
  before :each do
    FactoryGirl.create(:user)
    visit new_session_url
    fill_in "username", :with => "alice"
    fill_in "password", :with => "password"
    click_on "Sign In"
  end

  it "user can create goal" do
    visit user_url(user)
    fill_in "description", :with => "lose weight"
    check "private"
    click_on "Create Goal"

    expect(Goal.find_by_description("lose weight")).not_to be_nil
  end

  it "user can read goal" do
    visit user_url(user)
    fill_in "description", :with => "lose weight"
    check "private"
    click_on "Create Goal"

    expect(page).to have_content("lose weight")
  end

  it "user can update goal" do
    visit user_url(user)
    fill_in "description", :with => "lose weight"
    check "private"
    click_on "Create Goal"

    click_on "Edit Goal"
    fill_in "description", :with => "lose 20 pounds"
    click_on "Save Edit"

    expect(Goal.find_by_description("lose 20 pounds")).not_to be_nil
  end

  it "user can delete goal" do
    visit user_url(user)
    fill_in "description", :with => "lose weight"
    check "private"
    click_on "Create Goal"

    click_on "Delete Goal"

    expect(page).not_to have_content("lose weight")
  end
end
