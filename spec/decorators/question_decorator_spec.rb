require 'rails_helper'

describe QuestionDecorator do
  let(:answer_session) { double(:answer_session) }
  let(:question) { Fabricate(:question, prompt: 'How are you?') }

  context 'without answer session' do
    subject { QuestionDecorator.decorate(question) }
  end

end
