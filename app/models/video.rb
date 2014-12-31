class Video < ActiveRecord::Base
  belongs_to :presenter
  mount_uploader :thumbnail, ThumbnailUploader

  enum :host   => %i(you_tube vimeo)
  enum :status => %i(pending published)

  def self.latest
    published.order(:created_at => :desc)
  end
end
