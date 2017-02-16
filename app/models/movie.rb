class Movie < ApplicationRecord
   mount_uploader :image, AvatarUploader
end
