module ApplicationHelper
  def presenters
    Presenter.order(:name).map { |p| [p.name, p.id] }
  end

  def hosts
    Video.hosts.keys.map { |key| [key.titleize, key] }
  end

  def video_statuses
    Video.statuses.keys.map { |key| [key.titleize, key] }
  end
end
