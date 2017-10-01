class Genre < ApplicationRecord
  has_and_belongs_to_many :books

  SIZE_NAME_FIELD = 2..16
  validates :name,
            presence: true,
            uniqueness: true,
            length: { in: SIZE_NAME_FIELD }
end
