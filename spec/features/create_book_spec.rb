require 'rails_helper'

feature "CreateBook" do

  let!(:user) { create :user }


  scenario "Create Book" do

    login_as(user, scope: :user)
    visit "/books/new"

    expect(page).to have_css( 'form', id:'form-book')

    fill_in "Title", with: "Book created by test"
    fill_in "Author", with: "Rspec Test"
    fill_in "Summary", with: "Book created by Rspec Test"
    click_button "Save Book"

    expect(page).not_to have_text('Save Book')
    expect(page).to have_text('Book created by test')
  end

end