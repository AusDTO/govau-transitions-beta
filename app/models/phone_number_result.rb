class PhoneNumberResult < Result
  validates :phone_number, presence: true

  store_attributes :meta do
    phone_number String
  end
end
