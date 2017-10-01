require 'rails_helper'

describe Book do

  let(:book) { create :book }

  it 'works' do
    expect(book).to be_a Book
  end

  it 'is valid' do
    expect(book).to be_valid
  end

  # title
  it 'title should not be blank' do
    book.title = ''
    expect(book).to be_invalid
  end

  it 'title should not be too long' do
    book.title = 'a' * (Book::MAX_SIZE_TITLE + 1)
    expect(book).to be_invalid
  end

  it 'author and user should be unique' do
    duplicate_book1 = book.dup
    duplicate_book2 = book.dup
    book.save
    duplicate_book2.title = 'AaAaAaA aAaA'
    expect(duplicate_book1).to be_invalid
    expect(duplicate_book2).to be_valid
  end

  # author
  it 'author should not be blank' do
    book.author = ''
    expect(book).to be_invalid
  end

  it 'author should not be too long' do
    book.author = 'a' * (Book::SIZE_AUTHOR_FIELD.last + 1)
    expect(book).to be_invalid
  end

  it 'author should not be short' do
    book.author = 'a' * (Book::SIZE_AUTHOR_FIELD.first - 1 )
    expect(book).to be_invalid
  end

  # summary
  it 'summary should not be blank' do
    book.summary = ''
    expect(book).to be_invalid
  end

  it 'summary should not be too long' do
    book.summary = 'a' * (Book::SIZE_SUMMARY_FIELD.last + 1)
    expect(book).to be_invalid
  end

  it 'summary should not be short' do
    book.summary = 'a' * (Book::SIZE_SUMMARY_FIELD.first - 1 )
    expect(book).to be_invalid
  end

  it 'owner_book? for self user should be true' do
    user_id = book.user.id
    expect(book.owner_book?(user_id)).equal? true
  end

end