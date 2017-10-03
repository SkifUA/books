require 'rails_helper'

feature "See_Admin" do

  let!(:user) { create :user, admin: false }

  scenario "See admin" do
    user.admin = true
    user.save

    login_as(user, scope: :user)
    visit "/"

    page.find('a', text: 'Admin').click
    expect(page).to have_text('Site Administration')
  end

  scenario "Not see Admin" do
    login_as(user, scope: :user)
    visit "/"

    expect(page).not_to have_text('Admin')
    expect(page).to have_text('Books')
  end

  scenario "Not see Site Administration" do
    login_as(user, scope: :user)
    visit "/admin"

    expect(page).not_to have_text('Site Administration')
    expect(page).to have_text('Books')
  end

end
