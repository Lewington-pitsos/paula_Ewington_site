class Work < ApplicationRecord
  validates :place, presence: true,
                    numericality: { greater_than: 0 }
  mount_uploader :image, WorkUploader
  belongs_to :category
end
