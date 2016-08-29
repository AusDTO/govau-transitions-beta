require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { is_expected.to belong_to :question }
  it { is_expected.to belong_to :owner }
  it { is_expected.to validate_presence_of :owner }
  it { is_expected.to validate_presence_of :question }
  it { is_expected.to validate_presence_of :value }

  describe 'Uniqueness per question' do
    let!(:user) { Fabricate(:session_user) }
    let(:first_answer) { Fabricate(:answer, owner: user, question: question) }

    before do
      first_answer
    end

    subject { Fabricate.build(:answer, owner: user, question: question) }

    context 'validated for single choice questions' do
      let(:question) { Fabricate(:single_choice_question) }
      it { is_expected.not_to be_valid }
    end

    context 'not validated for multiple choice questions' do
      let(:question) { Fabricate(:multiple_choice_question) }
      it { is_expected.to be_valid }
    end
  end
end
