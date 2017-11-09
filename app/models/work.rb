class Work < ApplicationRecord
  mount_uploader :image, WorkUploader
end
