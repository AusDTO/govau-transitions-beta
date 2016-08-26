require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { is_expected.to belong_to :question }
  it { is_expected.to belong_to :owner }
  it { is_expected.to validate_uniqueness_of(:question_id).scoped_to(
    [:owner_type, :owner_id]) }
  it { is_expected.to validate_presence_of :owner }
  it { is_expected.to validate_presence_of :question }
  it { is_expected.to validate_presence_of :value }
end
