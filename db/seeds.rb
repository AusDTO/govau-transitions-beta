wizard = Wizard.create name: 'Helping older Australians'

person_question = SingleChoiceQuestion.create wizard: wizard do |q|
  q.prompt = 'Are you looking for yourself or someone else?'
  q.options = [{ label: 'Myself', value: 'second'},
    { label: 'Someone else', value: 'third'}]
end

InflectiveInterpolation.create wizard: wizard do |q|
  q.source = person_question
  q.name = 'subject'
  q.values = { second: 'you', third: 'they' }
end

InflectiveInterpolation.create wizard: wizard do |q|
  q.source = person_question
  q.name = 'possessive'
  q.values = { second: 'you', third: 'they' }
end




#attribute :dimensions, Hash[Symbol => Float]

SingleChoiceQuestion.create wizard: wizard do |q|
  q.prompt = 'How old are %{person:subject}?'
  q.options = Option.quick_list 'Under 50', '50 to 64', '65 to 79', '80 to 95',
    '95 plus'
end

SingleChoiceQuestion.create wizard: wizard do |q|
  q.prompt = 'Which best describes %{person:possessive} current need?'
  q.options = Option.quick_list 'I\'m thinking about the future',
    'I\'m starting not to manage', 'I know that I need some help',
    'I\'m in a crisis'
end

MultipleChoiceQuestion.create wizard: wizard do |q|
  q.prompt = 'What support are you interested in learning about?'
  q.options = Option.quick_list 'Staying at home',
    'Moving to a more appropriate setup', 'Getting out and about',
    'Health conditions'
end

MultipleChoiceQuestion.create wizard: wizard do |q|
  q.prompt = 'Are you concerned about any of these health issues?'
  q.options = Option.quick_list 'Arthritis', 'Dementia', 'Diabetes',
    'Emphysema', 'Incontinence', 'None of the above'
end

MultipleChoiceQuestion.create wizard: wizard do |q|
  q.prompt = 'Are you concerned about any of these emotional issues?'
  q.options = Option.quick_list 'Anxiety', 'Depression', 'Loneliness',
    'None of the above'
end

MultipleChoiceQuestion.create wizard: wizard do |q|
  q.prompt = 'What help is needed at home?'
  q.options = Option.quick_list 'Cooking and eating', 'Home maintenance',
    'Housework', 'Managing medications', 'Moving around the home',
    'Nursing care', 'Care for my cultural background', 'Personal hygiene',
    'Shopping', 'Staying fit', 'Supervision', 'Transport', 'None'
end

LocationQuestion.create wizard: wizard do |q|
  q.prompt = 'Where do you live?'
end

MultipleChoiceQuestion.create wizard: wizard do |q|
  q.prompt = 'What options are you interested in finding out about?'
  q.options = Option.quick_list 'Living near to xxx', 'Single storey',
    'Supervision and support', 'Nursing care', 'Staying independent at home',
    'Help in maintaining a home', 'Living in a community',
    'Cultural connections', 'None of the above'
end
