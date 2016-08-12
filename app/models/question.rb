class Question < ApplicationRecord
  belongs_to :wizard

  validates :order_num, uniqueness: { scope: :wizard_id }, presence: true
  validates :prompt, presence: true

  before_validation :generate_order_num

  private

  def generate_order_num
    return if order_num.present?
    return if wizard.nil?
    max = wizard.questions.maximum(:order_num)

    if max.present?
      self.order_num = max + 1
    else
      self.order_num = 0
    end
  end
end
