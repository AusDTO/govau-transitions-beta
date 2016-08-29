wizard = Wizard.create name: 'Helping older Australians'

SingleChoiceQuestion.create wizard: wizard do |q|
  q.prompt = 'Are you looking for yourself or someone else?'
  q.options = Option.quick_list 'Myself', 'Someone else'
end

SingleChoiceQuestion.create wizard: wizard do |q|
  q.prompt = 'How old are you?'
  q.options = Option.quick_list 'Under 50', '50 to 64', '65 to 79', '80 to 95',
    '95 plus'
end

SingleChoiceQuestion.create wizard: wizard do |q|
  q.prompt = 'Are you receiving a pension?'
  q.options = Option.quick_list 'Age pension', 'Disability pension',
    'Veteran/war widow or widower', 'Don\'t know', 'Other'
end
