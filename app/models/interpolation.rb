class Interpolation < ApplicationRecord
  include Storext.model

  VALID_FILTERS = %(capitalize downcase upcase)

  belongs_to :wizard
  belongs_to :source, class_name: 'Question'

  store_attributes :meta do
    filters Array[String]
    inflections Hash[String => String], default: {}
  end

  validates :wizard, :source, :name, presence: true
  validate :source_is_not_multiple
  validate :filters_are_valid

  def invoke(text, answer_session)
    text.gsub(/%\{#{name}(:[a-z_]+)*\}/) { |found|
      str = replace_from answer_session.answer_for source

      found.chomp('}').split(':').tap {|arr|
        arr.shift
      }.concat(filters).each {|filter|
        str = str.send filter
      }

      str
    }
  end

  def replace_from(answer)
    if inflections.any?
      inflections[answer.value]
    else
      answer.value
    end
  end

  private

  def source_is_not_multiple
    if source&.multiple_choice?
      errors.add(:source, 'Source question cannot be multiple choice')
    end
  end

  def filters_are_valid
    filters.each do |filter|
      unless VALID_FILTERS.include? filter
        errors.add(:filters, "Filter #{filter} is invalid")
      end
    end
  end
end
