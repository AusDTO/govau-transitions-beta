require 'rails_helper'

RSpec.describe Result, type: :model do
  it { is_expected.to belong_to :wizard }
  it { is_expected.to validate_presence_of :wizard }
  it { is_expected.to validate_presence_of :title }

  describe '#result_category' do
    let(:result) { Fabricate :result, container: container }
    subject { result.result_category }

    context 'no container' do
      let(:container) { nil }
      it { is_expected.to be_nil }
    end

    context 'contained in result category' do
      let(:container) { Fabricate(:result_category) }
      it { is_expected.to eq container }
    end

    context 'contained in result group with result category' do
      let(:category) { Fabricate(:result_category) }
      let(:container) { Fabricate(:result_group, result_category: category) }
      it { is_expected.to eq category }
    end
  end
end
