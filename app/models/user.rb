class User < ApplicationRecord
    validates :name, presence: true, length: {maximum: 20}, uniqueness: true
    validates :email, presence: true, length: {maximum: 255},
      format: {with: /\A[\w.!#$%&'*+\/=?^`{|}~-]+@[\w.-]+\.[\w-]+\z/i},
      uniqueness: true
    before_validation {email.downcase!}
    has_secure_password
    validates :password, length: {minimum: 6}, allow_nil: true
    has_many :posts
    mount_uploader :image, ImageUploader
    has_many :favorites, dependent: :destroy
    has_many :favorite_posts, through: :favorites, source: :post
end
