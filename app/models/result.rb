class Result < ApplicationRecord
  include Storext.model
  include Conditional

  belongs_to :wizard

  validates :title, presence: true
  validates :wizard, presence: true
end
