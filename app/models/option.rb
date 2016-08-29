class Option
  include Virtus.model

  # Convenience method to generate an array of hashes for which value is
  # paramaterised version of label. Feed this to e.g. 'options' attribute
  # of SingleChoiceQuestion.
  def self.quick_list(labels)
    labels.collect do |label|
      { label: label, value: label.parameterize }
    end
  end


  attribute :value, String
  attribute :label, String
end
