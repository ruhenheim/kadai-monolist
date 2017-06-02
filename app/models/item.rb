class Item < ApplicationRecord
  validates :code, :name, :url, :image_url, presence: true, length: { maximum: 255 }
  has_many :ownerships
  has_many :users, through: :ownerships
  has_many :wants
  has_many :want_users, through: :wants, class_name: 'User', source: :user
end
