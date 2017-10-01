require 'rails_helper'

describe User do

  let(:user) { create :user }

  it 'works' do
    expect(user).to be_a User
  end

  it 'is valid' do
    expect(user).to be_valid
  end


end