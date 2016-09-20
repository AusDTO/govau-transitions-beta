class ExternalLinkResult < Result
  validates :title, :url, presence: true

  store_attributes :meta do
    url String
  end
end
