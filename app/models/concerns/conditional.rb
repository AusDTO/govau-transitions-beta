=begin
Allows objects of the included class to be shown or hidden depending on the
related Conditions. (Currently, this class is included by Question and Result).
=end

module Conditional
  extend ActiveSupport::Concern

  included do
    has_many :conditions, as: :conditional
  end

  def visible_given_answers?(answers)
    conditions.all? do |condition|
      relevant_answers = answers.to_question condition.source
      relevant_answers.empty? || condition.check?(*relevant_answers.to_a)
    end
  end
end
