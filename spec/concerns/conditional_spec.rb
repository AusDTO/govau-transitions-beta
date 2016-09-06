require 'rails_helper'

describe Conditional do
  with_model :DummyConditional do
    table do |t|
    end

    model do
      include Conditional
    end
  end

  let(:question_one) { Fabricate(:boolean_question) }
  let(:question_two) { Fabricate(:boolean_question) }
  subject { DummyConditional.create }
  let(:user) { Fabricate(:answer_session) }
  let(:answer_one) { Fabricate(:answer, question: question_one,
    value: value_one, owner: user) }
  let(:answer_two) { Fabricate(:answer, question: question_two,
    value: value_two, owner: user) }
  let(:answers) { answer_one; answer_two; user.answers }
  let(:visibility) { subject.visible_given_answers? answers }
  let(:condition_one) { Fabricate(:condition, operator: 'eq',
    comparators: ['yes'], source: question_one, conditional: subject) }
  let(:condition_two) { Fabricate(:condition, operator: 'eq',
    comparators: ['yes'], source: question_two, conditional: subject) }

  before do
    subject.reload
  end

  shared_context 'no and no' do
    let(:value_one) { 'no' }
    let(:value_two) { 'no' }
  end

  shared_context 'yes and no' do
    let(:value_one) { 'yes' }
    let(:value_two) { 'no' }
  end

  shared_context 'yes and yes' do
    let(:value_one) { 'yes' }
    let(:value_two) { 'yes' }
  end

  context 'no conditions' do
    let(:conditions) { [] }

    context { include_context 'no and no' do
      specify { expect(visibility).to be true }
    end }

    context { include_context 'yes and no' do
      specify { expect(visibility).to be true }
    end }

    context { include_context 'yes and yes' do
      specify { expect(visibility).to be true }
    end }
  end

  context 'one condition' do
    let!(:conditions) { [condition_one] }

    context { include_context 'no and no' do
      specify { expect(visibility).to be false }
    end }

    context { include_context 'yes and no' do
      specify { expect(visibility).to be true }
    end }

    context { include_context 'yes and yes' do
      specify { expect(visibility).to be true }
    end }
  end

  context 'two conditions' do
    let!(:conditions) { [condition_one, condition_two] }

    context { include_context 'no and no' do
      specify { expect(visibility).to be false }
    end }

    context { include_context 'yes and no' do
      specify { expect(visibility).to be false }
    end }

    context { include_context 'yes and yes' do
      specify { expect(visibility).to be true }
    end }
  end
end
