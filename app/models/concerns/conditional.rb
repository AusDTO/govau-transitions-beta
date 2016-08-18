=begin

=end

module Conditional
  extend ActiveSupport::Concern

  included do
    has_many :conditions, as: :conditional
  end

  def visible_given_answers?(answers_hash)
    conditions.all? do |condition|
      condition.check? answers_hash[condition.source.id.to_s]
    end
  end
end
