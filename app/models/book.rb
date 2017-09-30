class Book < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :genres

  mount_uploader :image, BookUploader

  PERIOD_SIZE = 7

  scope :visible_for_user, -> (user_id) { where.not('user_id <> ? AND draft = true', user_id) }
  scope :visible_for_guest, -> () { where.not(draft: true) }
  scope :for_last_period, -> () { where(created_at: (Time.now - PERIOD_SIZE.day)..Time.now) }

  def owner_book?(user_id)
    self.user_id == user_id
  end
end
