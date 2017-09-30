class Book < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :genres

  validates_presence_of :title, :author, :summary

  mount_uploader :image, BookUploader

  LAST_PERIOD_SIZE = 7

  scope :visible_for_user, -> (user_id) { where.not('user_id <> ? AND draft = true', user_id) }
  scope :visible_for_guest, -> () { where.not(draft: true) }
  scope :for_last_period, -> () { where(created_at: (Time.now - LAST_PERIOD_SIZE.day)..Time.now) }
  scope :order_by_young, -> () { order(created_at: :desc) }

  def owner_book?(user_id)
    self.user_id == user_id
  end
end
