require 'rails_helper'

RSpec.describe Question, type: :model do
  subject { Fabricate.build :question }

  it { is_expected.not_to be_valid }

  it 'should have an error on type' do
    subject.valid?
    expect(subject.errors[:type].size).to eq 1 
  end
end
