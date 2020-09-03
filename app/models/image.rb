class Image < ApplicationRecord
<<<<<<< HEAD
  mount_uploader :src, ImageUploader
=======
>>>>>>> server_side-show_items
  belongs_to :item
end
