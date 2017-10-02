class User < ApplicationRecord
  has_many :books, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: { in: 6..50 }

  validates :password,
            presence: true,
            confirmation: true,
            length: { in: 6..32 },
            if: -> (m) { !m.password.nil? }

  validates :email,
            presence: true,
            length: { in: 6..250 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  before_destroy :admin_protection
  before_save   :downcase_email

  private

  def admin_protection
    throw(:abort) if self.admin?
  end

  def downcase_email
    self.email = email.downcase
  end
end
