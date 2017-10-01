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
    expect(page).to have_css( 'form', id:'form-book')

    fill_in "Title", with: "Book created by test"
    fill_in "Author", with: "Rspec Test"
    fill_in "Summary", with: "Book created by Rspec Test"
    click_button "Save Book"

    expect(page).not_to have_text('Save Book')
    expect(page).to have_text('Book created by test')
  end

  scenario "User can't create New Book" do

    visit "/"

    page.find('a', text: 'New Book').click

    expect(page).not_to have_css( 'form', id:'form-book')
  end

end