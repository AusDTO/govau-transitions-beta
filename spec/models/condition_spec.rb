require 'rails_helper'

RSpec.describe Condition, type: :model do
  it { is_expected.to validate_presence_of :source }
  it { is_expected.to validate_presence_of :conditional }
  it { is_expected.to validate_presence_of :operator }
  it { is_expected.to validate_presence_of :comparators }
  it { is_expected.to validate_inclusion_of(:operator).in_array(
    %w(eq gt lt ne in ex)) }

  describe 'appropriate comparators validation' do
    subject { Fabricate.build(:condition, operator: operator,
      comparators: comparators) }

    shared_examples 'enforces single comparator' do
      context do
        let(:comparators) { [1, 2, 3] }
        it { is_expected.not_to be_valid }
      end
    end

    shared_examples 'permits multiple comparators' do
      context do
        let(:comparators) { [1, 2, 3] }
        it { is_expected.to be_valid }
      end
    end

    shared_examples 'enforces numeric comparator' do
      context do
        let(:comparators) { ['foo'] }
        it { is_expected.not_to be_valid }
      end
    end

    shared_examples 'permits string comparator' do
      context do
        let(:comparators) { ['foo'] }
        it { is_expected.to be_valid }
      end
    end

    context 'equality' do
      let(:operator) { 'eq' }
      include_examples 'enforces single comparator'
      include_examples 'permits string comparator'
    end

    context 'inequality' do
      let(:operator) { 'ne' }
      include_examples 'enforces single comparator'
      include_examples 'permits string comparator'
    end

    context 'greater than' do
      let(:operator) { 'gt' }
      include_examples 'enforces single comparator'
      include_examples 'enforces numeric comparator'
    end

    context 'less than' do
      let(:operator) { 'lt' }
      include_examples 'enforces single comparator'
      include_examples 'enforces numeric comparator'
    end

    context 'inclusion' do
      let(:operator) { 'in' }
      include_examples 'permits multiple comparators'
      include_examples 'permits string comparator'
    end

    context 'exclusion' do
      let(:operator) { 'ex' }
      include_examples 'permits multiple comparators'
      include_examples 'permits string comparator'
    end
  end

  describe 'execution and negation' do
    let(:question) { Fabricate(:single_choice_question) do
      options { %w(1 2 3).collect {|word| { value: word, label: word }}} end }
    subject { Fabricate(:condition, operator: operator,
      comparators: comparators, source: question) }
    let(:comparators) { [2] } # Default - can be overriden in blocks

    shared_examples 'check answer' do |answer, bool|
      specify { expect(subject.check?(answer)).to be bool }
    end

    shared_examples 'negates to' do |obverse_operator, obverse_comparators|
      let(:negated) { subject.negate }
      specify { expect(negated.operator).to eq obverse_operator }
      specify { expect(negated.comparators).to eq obverse_comparators }
    end

    context 'equality' do
      let(:operator) { 'eq' }
      include_examples 'check answer', 2, true
      include_examples 'check answer', 3, false
      include_examples 'negates to', 'ne', ['2']
    end

    context 'greater than' do
      let(:operator) { 'gt' }
      include_examples 'check answer', 3, true
      include_examples 'check answer', 1, false
      include_examples 'check answer', 2, false
      include_examples 'negates to', 'lt', ['3']
    end

    context 'lesser than' do
      let(:operator) { 'lt' }
      include_examples 'check answer', 3, false
      include_examples 'check answer', 1, true
      include_examples 'check answer', 2, false
      include_examples 'negates to', 'gt', ['1']
    end

    context 'not equal' do
      let(:operator) { 'ne' }
      include_examples 'check answer', 3, true
      include_examples 'check answer', 1, true
      include_examples 'check answer', 2, false
      include_examples 'negates to', 'eq', ['2']
    end

    context 'inclusion' do
      let(:operator) { 'in' }
      let(:comparators) { [1, 2] }
      include_examples 'check answer', 3, false
      include_examples 'check answer', 1, true
      include_examples 'check answer', 2, true
      include_examples 'negates to', 'ex', ['1', '2']
    end

    context 'exclusion' do
      let(:operator) { 'ex' }
      let(:comparators) { [1, 2] }
      include_examples 'check answer', 3, true
      include_examples 'check answer', 1, false
      include_examples 'check answer', 2, false
      include_examples 'negates to', 'in', ['1', '2']
    end
  end
end
