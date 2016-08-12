require 'rails_helper'

RSpec.describe "Questions", type: :request do
  let(:wizard) { Fabricate(:wizard) }

  context 'Linear progression, no branching' do
    let!(:question_one) { Fabricate(:boolean_question, wizard: wizard) }
    let!(:question_two) { Fabricate(:single_choice_question, wizard: wizard) }
    let!(:question_three) { Fabricate(:single_choice_question, wizard: wizard) }

    before do
      get "/transitions/#{wizard.slug}/#{answer_parts.join('/')}"
    end

    subject { response.body }

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
end
