class Condition < ApplicationRecord
  include Storext.model
  
  OPERATORS = %w(eq gt lt ne in ex)

  belongs_to :source, class_name: 'Question'
  belongs_to :conditional, polymorphic: true

  store_attributes :meta do
    comparators Array[String]
  end

  validates :source, :conditional, :operator, :comparators, presence: true
  validates :operator, inclusion: { in: OPERATORS }
  validate :appropriate_comparators

  def check?(*answers)

  end

  private

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
