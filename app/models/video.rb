class Video < ApplicationRecord
  mount_uploader :video_top, VideoUploader
end
