module ApplicationHelper
  def govau_url(path = '/')
    "#{ENV['GOVAU_URL_ROOT']}#{path}"
  end
end
