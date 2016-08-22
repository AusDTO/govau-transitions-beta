require 'rails_helper'

RSpec.describe "Questions", type: :request do
  let(:wizard) { Fabricate(:wizard) }
  let!(:question_one) { Fabricate(:boolean_question, wizard: wizard) }
  let(:path) { "/transitions/#{wizard.slug}/#{answer_parts.join('/')}" }
  subject { response.body }

  context 'Linear progression, no branching' do
    let!(:question_two) { Fabricate(:single_choice_question, wizard: wizard) }
    let!(:question_three) { Fabricate(:single_choice_question, wizard: wizard) }

    describe 'Browsing directly' do
      before { get path }

      describe 'Wizard landing page' do
        let(:answer_parts) { [] }
        it { is_expected.to include question_one.prompt }
      end

      describe 'Second question' do
        let(:answer_parts) { [question_one.id, 'yes'] }
        it { is_expected.to include question_two.prompt }
      end

      describe 'Third question' do
        let(:answer_parts) { [question_one.id, 'yes', question_two.id,
          question_two.options.first.value] }
        it { is_expected.to include question_three.prompt }
      end
    end

    describe 'Answering question' do
      let(:answer_parts) { [question_one.id, 'yes'] }

      before { post path, params: { question: { id: question_two.id } } }
  end

  context 'Conditional question' do
    let(:condition_yes) { Fabricate(:condition, source: question_one,
      operator: 'eq', comparators: ['yes']) }
    let(:condition_no) { Fabricate(:condition, source: question_one,
      operator: 'eq', comparators: ['no']) }
    let!(:question_two) { Fabricate(:single_choice_question, wizard: wizard,
      conditions: [condition_yes]) }
    let!(:question_three) { Fabricate(:single_choice_question, wizard: wizard,
      conditions: [condition_no]) }

    before { get path }

    describe 'Answering yes' do
      let(:answer_parts) { [question_one.id, 'yes'] }
      it { is_expected.to include question_two.prompt }
    end

    describe 'Answering no' do
      let(:answer_parts) { [question_one.id, 'no'] }
      it { is_expected.to include question_three.prompt }
    end
  end
end
