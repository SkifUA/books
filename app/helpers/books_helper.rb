module BooksHelper
  def genres_to_string(genres)
    genres.map{ |g| g.name }.join(', ')
  end
end
