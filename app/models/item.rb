class Item < ApplicationRecord
  validates :code, :name, :url, :image_url, presence: true, length: { maximum: 255 }
end
