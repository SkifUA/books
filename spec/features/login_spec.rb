require 'rails_helper'

feature "Login" do

  let!(:user) { build :user }
  before(:each) { user.save }

  scenario "User can't create New Book" do
    visit "/"

    page.find('a', text: 'New Book').click

    expect(page).not_to have_css( 'form', id:'form-book')
  end

  scenario "User login" do
    visit "/users/sign_in"

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "111111"
    click_button "Log in"

    expect(page).to have_text('Logout')
  end
end