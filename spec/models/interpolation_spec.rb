require 'rails_helper'

RSpec.describe Interpolation, type: :model do
  it { is_expected.to validate_presence_of :wizard }
  it { is_expected.to validate_presence_of :source }
  it { is_expected.to validate_presence_of :name }

  describe 'source' do
    subject { Fabricate(:interpolation, source: source) }

    context 'multiple-choice' do
      let(:source) { Fabricate(:multiple_choice_question) }
      it { is_expected.not_to be_valid }
    end

    context 'single-choice' do
      let(:source) { Fabricate(:single_choice_question) }
      it { is_expected.to be_valid }
    end
  end

  describe '#invoke' do
    let(:user) { Fabricate(:answer_session) }
    let(:fav_colour) { Fabricate(:single_choice_question,
      options: Option::quick_list 'red', 'green', 'blue') }
    let(:binary_gender) { Fabricate(:single_choice_question,
      options: Option::quick_list 'male', 'female') }
    let(:colour_answer) { Fabricate(:answer, owner: user, value: 'blue',
      question: fav_colour) }
    let(:binary_gender) { Fabricate(:answer, owner: user, value: 'female',
      question: binary_gender) }

    describe 'straight: no filters or inflections' do
      
    end
  end
end
