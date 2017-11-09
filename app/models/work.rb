class Work < ApplicationRecord
  mount_uploader :image, WorkUploader
  belongs_to :category
end
