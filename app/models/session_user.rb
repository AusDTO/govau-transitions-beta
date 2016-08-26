class SessionUser < ApplicationRecord
  has_many :answers, as: :owner
end
