RSpec.shared_examples 'question model' do |class_name|
  it { is_expected.to belong_to :wizard }
  it { is_expected.to validate_uniqueness_of(:order_num).scoped_to(:wizard_id) }
  it { is_expected.to validate_presence_of :order_num }
  it { is_expected.to validate_presence_of :prompt }

  describe 'Automatic ordering' do
    let(:wizard) { Fabricate(:wizard) }
    let!(:question_one) { Fabricate(class_name, wizard: wizard) }
    let!(:question_two) { Fabricate(class_name, wizard: wizard) }

    it { expect(question_one.order_num).to eq 0 }
    it { expect(question_two.order_num).to eq 1 }
  end
end
