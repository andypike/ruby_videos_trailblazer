class Video::Cell < Cell::Concept
  include ActionView::Helpers::AssetTagHelper

  def show
    render
  end

  def title
    model.title
  end

  def thumbnail_url
    model.thumbnail_url
  end
end
