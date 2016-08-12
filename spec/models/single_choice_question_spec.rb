require 'rails_helper'
require './spec/support/examples_for_questions'

RSpec.describe SingleChoiceQuestion, type: :model do
  it_behaves_like 'question model', :single_choice_question
end
