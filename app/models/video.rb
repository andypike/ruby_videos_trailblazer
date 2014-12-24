class Video < ActiveRecord::Base
  mount_uploader :thumbnail, ThumbnailUploader

  enum :host   => %i(you_tube vimeo)
  enum :status => %i(pending published)
end
