class About < ApplicationRecord
  mount_uploader :image, WorkUploader
  mount_uploader :cover, WorkUploader 
end
