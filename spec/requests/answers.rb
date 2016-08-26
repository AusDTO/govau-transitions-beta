require 'rails_helper'
require 'byebug'

RSpec.describe 'Answers', type: :request do
  let(:wizard) { Fabricate(:wizard) }
  let!(:question_one) { Fabricate(:single_choice_question, wizard: wizard) }
  let!(:question_two) { Fabricate(:single_choice_question, wizard: wizard) }
  let!(:question_three) { Fabricate(:single_choice_question, wizard: wizard) }

  subject do
    post path, answer: { options: option }
  end

  # context 'Linear progression, no branching' do
  #   let(:option) { 'yes' }
  #
  #   describe 'First question' do
  #     let(:path) { question_answers_path question_id: question_one.id }
  #     it { is_expected.to redirect_to question_path question_two }
  #   end
  #
  #   describe 'Last question' do
  #     let(:path) { question_answers_path question_id: question_three.id }
  #     it { is_expected.to redirect_to wizard_results_path wizard_id: wizard.slug }
  #   end
  # end

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
      # byebug
    end

    describe 'Answering yes' do
      let(:option) { 'yes' }
      # it { is_expected.to redirect_to question_path question_two }
    end

    describe 'Answering no' do
      let(:option) { 'no' }
      it { is_expected.to redirect_to question_path question_three }
    end
  end
end
