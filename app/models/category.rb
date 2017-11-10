class Category < ApplicationRecord
  validates :title, :presence => true;

  mount_uploader :image, CategoryUploader
  has_many :works
end
