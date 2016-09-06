require 'rails_helper'

RSpec.describe Interpolation, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :wizard }
    it { is_expected.to validate_presence_of :source }
    it { is_expected.to validate_presence_of :name }

    describe 'source' do
      subject { Fabricate.build(:interpolation, source: source) }

      context 'multiple-choice' do
        let(:source) { Fabricate(:multiple_choice_question) }
        it { is_expected.not_to be_valid }
      end

      context 'single-choice' do
        let(:source) { Fabricate(:single_choice_question) }
        it { is_expected.to be_valid }
      end
    end

    describe 'filters' do
      subject { Fabricate.build(:interpolation, filters: filters) }

      describe 'allowed' do
        let(:filters) { ['capitalize'] }
        it { is_expected.to be_valid }
      end

      describe 'unknown' do
        let(:filters) { ['capitalism'] }
        it { is_expected.not_to be_valid }
      end

      describe 'empty' do
        let(:filters) { [] }
        it { is_expected.to be_valid }
      end
    end
  end


  describe '#invoke' do
    let(:answer_session) { Fabricate(:answer_session) }
    subject { interpolation.invoke(text, answer_session) }

    describe 'uninflected' do
      let(:question) { Fabricate(:single_choice_question,
        options: Option::quick_list('red', 'green', 'blue')) }
      let!(:answer) { Fabricate(:answer, owner: answer_session,
        value: 'blue', question: question) }

      describe 'no filters' do
        let(:interpolation) { Fabricate(:interpolation, name: 'colour',
          source: question) }
        let(:text) { 'I want a %{colour} balloon!' }
        it { is_expected.to eq 'I want a blue balloon!' }
      end

      describe 'static filters' do
        let(:interpolation) { Fabricate(:interpolation, name: 'colour',
          source: question, filters: ['upcase']) }
        let(:text) { 'Balloon colour: %{colour}.' }
        it { is_expected.to eq 'Balloon colour: BLUE.' }
      end

      describe 'dynamic filters' do
        let(:interpolation) { Fabricate(:interpolation, name: 'colour',
          source: question) }
        let(:text) { '%{colour:capitalize} is the colour of my balloon.' }
        it { is_expected.to eq 'Blue is the colour of my balloon.' }
      end
    end

    describe 'inflected' do
      let(:question) { Fabricate(:single_choice_question,
        options: Option::quick_list('male', 'female')) }
      let!(:answer) { Fabricate(:answer, owner: answer_session,
        value: 'female', question: question) }
      let(:interpolation) { Fabricate(:interpolation, name: 'pronoun',
        source: question, inflections: { male: 'he', female: 'she' })}
      let(:text) { '%{pronoun:capitalize} came, %{pronoun} saw, %{pronoun} conquered.' }
      it { is_expected.to eq 'She came, she saw, she conquered.'}
    end
  end
end
