class Question < ApplicationRecord
  belongs_to :wizard

  validates :order_num, uniqueness: { scope: :wizard_id }, presence: true
  validates :prompt, presence: true

  before_create :generate_order_num

  private

  def generate_order_num
    puts "wizard: #{wizard}, order num: #{order_num}"

    return if order_num.present?
    return if wizard.nil?

    puts "I'm here ... #{ wizard.questions.max(:order_num)}"

    self.order_num = wizard.questions.max(:order_num) || 0
  end
end
