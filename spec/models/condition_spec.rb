require 'rails_helper'

RSpec.describe Condition, type: :model do
  it { is_expected.to validate_presence_of :source }
  it { is_expected.to validate_presence_of :conditional }
  it { is_expected.to validate_presence_of :operator }
  it { is_expected.to validate_presence_of :comparators }
  it { is_expected.to validate_inclusion_of(:operator).in_array(
    %w(eq gt lt ne in ex)) }

  describe 'appropriate comparators validation' do
    subject { Fabricate(:condition) do
      operator { operator }
      comparators { comparators }
    end }

    shared_examples 'enforces single comparator' do |op|
      let(:operator) { op }
      let(:comparators) { [1, 2, 3] }
      it { is_expected.not_to be_valid }
    end

    shared_examples 'permits multiple comparators' do |op|
      let(:operator) { op }
      let(:comparators) { [1, 2, 3] }
      it { is_expected.to be_valid }
    end

    shared_examples 'enforces numeric comparator' do |op|
      let(:operator) { op }
      let(:comparators) { ['foo'] }
      it { is_expected.not_to be_valid }
    end

    shared_examples 'permits string comparator' do  |op|
      let(:operator) { op }
      let(:comparators) { ['foo'] }
      it { is_expected.to be_valid }
    end

    context 'equality' do
      include_examples 'enforces single comparator', 'eq'
      include_examples 'permits string comparator', 'eq'
    end

    context 'inequality' do
      include_examples 'enforces single comparator', 'ne'
      include_examples 'permits string comparator', 'ne'
    end

    context 'greater than' do
      include_examples 'enforces single comparator', 'gt'
      include_examples 'enforces numeric comparator', 'gt'
    end

    context 'less than' do
      include_examples 'enforces single comparator', 'lt'
      include_examples 'enforces numeric comparator', 'lt'
    end

    context 'inclusion' do
      include_examples 'permits multiple comparators', 'in'
      include_examples 'permits string comparator', 'in'
    end

    context 'exclusion' do
      include_examples 'permits multiple comparators', 'ex'
      include_examples 'permits string comparator', 'ex'
    end
  end

  describe 'check?' do
    let(:question) { Fabricate(:single_choice_question) do
      options { %w(1 2 3).collect {|word| { value: word, label: word }}} end }
    let(:condition) { Fabricate(:condition, operator: operator,
      comparators: [2], source: question) }
    subject { condition.check? answer }

    context 'equality' do
      let(:operator) { 'eq' }

      context 'equal' do
        let(:answer) { '2' }
        it { is_expected.to be_true }
      end

      context 'unequal' do
        let(:answer) { '3' }
        it { is_expected.not_to be_true }
      end

      context 'invalid' do
        let(:answer) { '4' }

        it 'should throw an error' do
          expect{ subject }.to raise_error
        end
      end
    end

    context 'greater than' do
      let(:operator) { 'gt' }

      context 'greater' do
        let(:answer) { '3' }
        it { is_expected.to be_true }
      end

      context 'lesser' do
        let(:answer) { '1' }
        it { is_expected.not_to be_true }
      end

      context 'equal' do
        let(:answer) { '2' }
        it { is_expected.not_to be_true }
      end
    end

    context 'lesser than' do
      let(:operator) { 'lt' }

      context 'greater' do
        let(:answer) { '3' }
        it { is_expected.not_to be_true }
      end

      context 'lesser' do
        let(:answer) { '1' }
        it { is_expected.to be_true }
      end

      context 'equal' do
        let(:answer) { '2' }
        it { is_expected.not_to be_true }
      end
    end

    context 'not equal' do
      let(:operator) { 'ne' }

      context 'greater' do
        let(:answer) { '3' }
        it { is_expected.to be_true }
      end

      context 'lesser' do
        let(:answer) { '1' }
        it { is_expected.to be_true }
      end

      context 'equal' do
        let(:answer) { '2' }
        it { is_expected.not_to be_true }
      end
    end
  end

  describe 'negate' do
  end
end
