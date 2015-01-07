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

  def smooth_link_to(text, anchor)
    href = root_path(:anchor => anchor)
    href = "##{anchor}" if controller_name == "home"

    link_to text, href, :class => "scroll-smooth"
  end
end
