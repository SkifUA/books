module BooksHelper
  def genres_to_string(genres)
    genres.map{ |g| g.name }.join(', ')
  end

  def image_generator(height:, width:)
    "http://placehold.it/#{height}x#{width}"
  end

  def book_img(img, type='main')
    if type == 'thumb'
      img.model.image? ? img : image_generator(height: '60', width: '40')
    else
      img.model.image? ? img : image_generator(height: '600', width: '400')
    end
  end
end
