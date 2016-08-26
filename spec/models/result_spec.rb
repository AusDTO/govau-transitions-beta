require 'rails_helper'

RSpec.describe Result, type: :model do
  it { is_expected.to belong_to :wizard }
  it { is_expected.to validate_presence_of :wizard }
  it { is_expected.to validate_presence_of :title }
end
