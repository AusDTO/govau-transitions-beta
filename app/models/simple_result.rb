class SimpleResult < Result
  validates :title, presence: true

  store_attributes :meta do
    body String
  end
end
