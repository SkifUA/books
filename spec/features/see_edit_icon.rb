require 'rails_helper'

feature "Login" do

  let!(:user1) { build :user }
  let!(:user2) { build :user, email: 'user2@example.com' }
  let!(:book) { build :book, user: user1}

  before(:each) { user1.save }

  scenario "See edit icon" do
    book.save

    visit "/users/sign_in"

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "111111"
    click_button "Log in"

    expect(page).to have_css( 'i', class:'fa fa-pencil-square-o')
  end

  scenario "Not see edit icon" do
    book.user = user2
    book.save

    visit "/users/sign_in"

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "111111"
    click_button "Log in"

    expect(page).not_to have_css( 'i', class:'fa fa-pencil-square-o')
  end

end
