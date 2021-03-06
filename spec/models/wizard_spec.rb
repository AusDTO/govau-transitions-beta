require 'rails_helper'

RSpec.describe Wizard, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :slug }
  it { is_expected.to validate_uniqueness_of :slug }
end
