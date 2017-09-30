module BooksHelper
  def genres_to_string(genres)
    genres.map{ |g| g.name }.join(', ')
  end

  def image_generator(height:, width:)
    "http://placehold.it/#{height}x#{width}"
  end

  def book_img(img, type='main')
    if type == 'thumb'
      img.model.image? ? img : image_generator(height: BookUploader::SIZE_THUMB[:height],  width: BookUploader::SIZE_THUMB[:width])
    else
      img.model.image? ? img : image_generator(height: BookUploader::SIZE_MAIN[:height], width: BookUploader::SIZE_MAIN[:width])
    end
  end
end
