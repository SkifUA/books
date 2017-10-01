class Book < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :genres

  LAST_PERIOD_SIZE = 7
  MAX_SIZE_TITLE = 36
  SIZE_AUTHOR_FIELD = 2..50
  SIZE_SUMMARY_FIELD = 8..800


  validates :author, presence: true, length: { in: SIZE_AUTHOR_FIELD }
  validates :title, presence: true,
                    uniqueness: { scope: :author },
                    length: { maximum: MAX_SIZE_TITLE }
  validates :summary, presence: true, length: { in: SIZE_SUMMARY_FIELD }

  mount_uploader :image, BookUploader

  scope :visible_for_user, -> (user_id) { where.not('user_id <> ? AND draft = true', user_id) }
  scope :visible_for_guest, -> () { where.not(draft: true) }
  scope :for_last_period, -> () { where(created_at: (Time.now - LAST_PERIOD_SIZE.day)..Time.now) }
  scope :order_by_young, -> () { order(created_at: :desc) }

  def owner_book?(user_id)
    self.user_id == user_id
  end
end
