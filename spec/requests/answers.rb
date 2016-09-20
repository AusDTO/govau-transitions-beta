require 'rails_helper'
require 'byebug'

RSpec.describe 'Answers', type: :request do
  let(:wizard) { Fabricate(:wizard) }

  describe 'flow' do
    let!(:question_one) { Fabricate(:single_choice_question, wizard: wizard) }
    let!(:question_two) { Fabricate(:single_choice_question, wizard: wizard) }
    let!(:question_three) { Fabricate(:single_choice_question, wizard: wizard) }

    subject do
      post path, answer: { options: option }
    end

    context 'Linear progression, no branching' do
      let(:option) { 'yes' }

      describe 'First question' do
        let(:path) { question_answers_path question_id: question_one.id }
        it { is_expected.to redirect_to question_path question_two }
      end

      describe 'Last question' do
        let(:path) { question_answers_path question_id: question_three.id }
        it { is_expected.to redirect_to wizard_result_categories_path wizard_id: wizard.slug }
      end
    end

    context 'Conditional question' do
      let!(:condition_yes) { Fabricate(:condition, source: question_one,
        conditional: question_two, operator: 'eq', comparators: ['yes']) }
      let!(:condition_no) { Fabricate(:condition, source: question_one,
        conditional: question_three, operator: 'eq', comparators: ['no']) }
      let(:path) { question_answers_path question_id: question_one.id }

      before do
        question_one.reload
        question_two.reload
        question_three.reload
      end

      describe 'Answering yes' do
        let(:option) { 'yes' }
        it { is_expected.to redirect_to question_path question_two }
      end

      describe 'Answering no' do
        let(:option) { 'no' }
        it { is_expected.to redirect_to question_path question_three }
      end
    end
  end

  describe 'multiple answers' do
    let(:options) { Option.quick_list('foo', 'bar', 'etc')  }
    let(:path) { question_answers_path question_id: question.id }

    subject do
      post path, answer: { options: ['foo', 'bar'] }
    end

    context 'single choice question' do
      let(:question) { Fabricate(:single_choice_question, wizard: wizard,
        options: options) }

      # TODO restore once validation is in place
      # specify { expect(response.body).to include question.prompt }
    end

    context 'multiple choice question' do
      context 'valid answers' do
        let(:question) { Fabricate(:multiple_choice_question, wizard: wizard,
          options: options) }

        it { is_expected.to redirect_to wizard_result_categories_path(
          wizard_id: wizard.slug) }
        specify { subject; expect(AnswerSession.last.answers.where(
          question_id: question.id).count).to eq 2 }
      end

      context 'invalid answers' do
        let(:question) { Fabricate(:multiple_choice_question, wizard: wizard,
          options: Option.quick_list('something', 'else')) }

        # TODO restore once validation is in place
        # specify { expect(response.body).to include question.prompt }
      end
    end
  end
end
