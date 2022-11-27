class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :email, presence: true
  validates :password, presence: true
end
