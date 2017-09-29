json.extract! book, :id, :title, :user_id, :image, :summary, :draft, :created_at, :updated_at
json.url book_url(book, format: :json)
