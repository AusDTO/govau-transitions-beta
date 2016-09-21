class TopicPageResult < Result
  validates :title, :path, presence: true

  store_attributes :meta do
    path String
  end
end
