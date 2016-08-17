class Condition < ApplicationRecord
  include Storext.model

  OPERATORS = %w(eq ne gt lt in ex)

  belongs_to :source, class_name: 'Question'
  belongs_to :conditional, polymorphic: true

  store_attributes :meta do
    comparators Array[String]
  end

  validates :source, :conditional, :operator, :comparators, presence: true
  validates :operator, inclusion: { in: OPERATORS }
  validate :appropriate_comparators

  def check?(*answers)
    case operator
    when 'ne', 'ex'
      answers.all? {|answer| check_answer(answer)}
    else
      answers.any? {|answer| check_answer(answer)}
    end
  end

  def negate
    negated_operator, negated_comparators = case operator
    when 'eq'
      ['ne', comparator]
    when 'ne'
      ['eq', comparator]
    when 'gt'
      ['lt', numeric_comparator + 1]
    when 'lt'
      ['gt', numeric_comparator - 1]
    when 'in'
      ['ex', comparators]
    when 'ex'
      ['in', comparators]
    end

    Condition.new source: source,
      operator: negated_operator,
      comparators: negated_comparators
  end

  private

  def check_answer(answer)
    case operator
    when 'eq'
      answer.to_s == comparator
    when 'ne'
      answer.to_s != comparator
    when 'lt'
      answer.to_i < numeric_comparator
    when 'gt'
      answer.to_i > numeric_comparator
    when 'in'
      comparators.include? answer.to_s
    when 'ex'
      !comparators.include? answer.to_s
    end
  end

  # For operators other than 'in', there will be only one comparator
  def comparator
    comparators.first
  end

  # For greater and lesser operations, we need the comparator as an integer
  def numeric_comparator
    comparator.to_i
  end

  def appropriate_comparators
    if %w(eq ne lt gt).include? operator
      errors.add(:comparators, 'Too many comparators') if comparators.size > 1

      if %w(lt gt).include? operator
        if comparator !~ /^\d+$/ # We only want positive denary integers
          errors.add(:comparators, 'Non-integer comparator')
        end
      end
    end
  end
end
