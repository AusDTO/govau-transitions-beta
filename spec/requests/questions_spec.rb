require 'rails_helper'

RSpec.describe "Questions", type: :request do
  let(:wizard) { Fabricate(:wizard) }

  context 'Linear progression, no branching' do
    let!(:question_one) { Fabricate(:boolean_question, wizard: wizard) }
    let!(:question_two) { Fabricate(:single_choice_question, wizard: wizard) }
    let!(:question_three) { Fabricate(:single_choice_question, wizard: wizard) }

    describe 'Wizard landing page' do
      it 'displays the first question' do
        get "/#{wizard.slug}"
        expect(response.body).to include(question_one.body)
      end
    end

    describe 'Second question' do
      it 'displays the second question' do
        get "/#{wizard.slug}/true"
        expect(response.body).to include(question_two.body)
      end
    end

    describe 'Third question' do
      it 'displays the third question' do
        get "/#{wizard.slug}/true/#{question_one.options.first.value}"
        expect(response.body).to include(question_three.body)
      end
    end
  end
end
