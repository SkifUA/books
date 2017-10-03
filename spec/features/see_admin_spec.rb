require 'rails_helper'

feature "See_Admin" do

  let!(:user) { create :user }

  scenario "See admin" do

    login_as(user, scope: :user)

    visit "/"

    page.find('a', text: 'Admin').click
    expect(page).to have_text('Site Administration')
  end

  scenario "Not see admin" do
    user.admin = false
    user.save

    visit "/users/sign_in"

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "111111"
    click_button "Log in"

    expect(page).not_to have_text('Admin')
  end

end
