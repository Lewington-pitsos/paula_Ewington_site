class Category < ApplicationRecord
  mount_uploader :image, CategoryUploader
  has_many :works
end
