require 'rails_helper'

feature "Login" do

  let!(:user) { build :user }
  before(:each) { user.save }

  scenario "Create Book" do

    visit "/users/sign_in"

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "111111"
    click_button "Log in"

    page.find('a', text: 'New Book').click

    fill_in "Title", with: "Book created by test"
    fill_in "Author", with: "Rspec Test"
    fill_in "Summary", with: "Book created by Rspec Test"
    click_button "Save Book"

    expect(page).to have_text('Book created by test')
  end

end