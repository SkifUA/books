require 'rails_helper'

feature "See_Edit_Icon" do

  let!(:user1) { create :user }
  let!(:user2) { create :user, email: 'user2@example.com' }
  let!(:book) { create :book, user: user1}


  scenario "See edit icon" do
    login_as(user1, scope: :user)
    visit "/"

    expect(page).to have_css( 'i', class:'fa fa-pencil-square-o')
  end

  scenario "Not see edit icon" do
    book.user = user2
    book.save

    login_as(user1, scope: :user)
    visit "/"

    expect(page).not_to have_css( 'i', class:'fa fa-pencil-square-o')
  end

end
