require 'rails_helper'

describe Genre do


  # let(:user) { create :user }
  let(:book) { create :book }
  let(:genre) { create :genre }

  it 'works' do
    expect(genre).to be_a Genre
  end

  it 'is valid' do
    expect(genre).to be_valid
  end

  # name
  it 'name should not be blank' do
    genre.name = ''
    expect(genre).to be_invalid
  end

  it 'name should not be too long' do
    genre.name = 'a' * (Book::MAX_SIZE_TITLE + 1)
    expect(genre).to be_invalid
  end

  it 'name should be unique' do
    duplicate_genre = genre.dup
    genre.save
    expect(duplicate_genre).to be_invalid
  end

end