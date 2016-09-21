class Result < ApplicationRecord
  include Storext.model
  include Conditional

  scope :orphans, -> { where('container IS NULL') }

  belongs_to :wizard
  belongs_to :container, polymorphic: true

  validates :wizard, presence: true

  def orphan?
    container.nil?
  end

  def result_category
    if container.present?
      if container_type == 'ResultCategory'
        container
      elsif container.respond_to? :result_category
        container.result_category
      end
    end
  end

  def result_group
    if container_type == 'ResultGroup'
      container
    end
  end

  def visible_given_answers?(answers)
    super || container.try(:visible_given_answers?, answers)
  end
end
