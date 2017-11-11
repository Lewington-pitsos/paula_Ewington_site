class Category < ApplicationRecord
  validates :title, :presence => true;
  attr_accessor :place
  validates :place, presence: true,
                    numericality: { greater_than: 0 }


  mount_uploader :image, CategoryUploader
  has_many :works
end
