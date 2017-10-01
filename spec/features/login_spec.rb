require 'rails_helper'

feature "Login" do

  let!(:user) { build :user }
  before(:each) { user.save }

  scenario "User login" do

    visit "/users/sign_in"

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "111111"
    click_button "Log in"
    expect(page).to have_text('New Book')
  end

end