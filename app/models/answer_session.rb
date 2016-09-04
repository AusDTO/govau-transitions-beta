class AnswerSession < ApplicationRecord
  has_secure_token

  belongs_to :wizard
  has_many :answers, as: :owner
end
