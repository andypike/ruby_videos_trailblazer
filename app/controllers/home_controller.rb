class HomeController < ApplicationController
  def show
    @latest_videos = Video.latest
  end
end
