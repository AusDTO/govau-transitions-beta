class ResultGroup < ApplicationRecord
  include Conditional

  belongs_to :result_category
  has_many :results, as: :container

  delegate :wizard, to: :result_category
end
