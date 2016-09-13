require 'rails_helper'

describe QuestionDecorator do
  let(:normal_prompt) { 'How are you?' }
  let(:interpolated_prompt) { 'Who are you?' }
  let(:session_double) { double(:answer_session) }
  let(:question) { Fabricate(:single_choice_question, prompt: normal_prompt) }
  subject { QuestionDecorator.decorate(question, context: decorator_context) }

  context 'without answer session' do
    let(:decorator_context) { {} }
    specify { expect(subject.prompt).to eq normal_prompt }
  end

  context 'with answer session' do
    let(:decorator_context) { { answer_session: session_double } }

    it 'should invoke AnswerSession#interpolate' do
      expect(session_double).to receive(:interpolate).with(
        normal_prompt).and_return(interpolated_prompt)

      expect(subject.prompt).to eq interpolated_prompt
    end
  end
end
