require 'rails_helper'

describe User do

  let(:user) { create :user }

  it 'works' do
    expect(user).to be_a User
  end

  it 'is valid' do
    expect(user).to be_valid
  end

  # name validation
  it 'name should not be blank' do
    user.name = ''
    expect(user).to be_invalid
  end

  it 'name should not be short' do
    user.name = 'kl'
    expect(user).to be_invalid
  end

  it 'name should not be too long' do
    user.name = 'k' * 51
    expect(user).to be_invalid
  end

  # email validation
  it "email is validated" do
    expect(user).to validate_presence_of(:email)
  end

  it "email should be present" do
    user.email = "     "
    expect(user).to be_invalid
  end

  it "email should not be too long" do
    user.email = "a" * 250  + "@example.com"
    expect(user).to be_invalid
  end

  it 'email addresses should be unique' do
    duplicate_user = user.dup
    user.save
    expect(duplicate_user).to be_invalid
  end

  it 'email addresses should be saved as lower-case' do
    mixed_case_email = "Foo@ExAMPle.CoM"
    user.email = mixed_case_email
    user.save
    expect(mixed_case_email.downcase).to eq(user.reload.email)
  end

  # password validate

  it 'password should not be blank' do
    user.name = ''
    expect(user).to be_invalid
  end

  it 'password should not be short' do
    user.password = 'kl'
    expect(user).to be_invalid
  end

  it 'password should not be too long' do
    user.password = 'k' * 33
    expect(user).to be_invalid
  end

  it 'password should be like password_confirmed' do
    user.password = '2222222'
    expect(user).to be_invalid
  end

  # admin
  it 'admin_user should not be destroy' do
    user.admin = true
    user.destroy
    expect(user).to be_valid
  end

end