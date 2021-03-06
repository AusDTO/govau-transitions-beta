# n.b. These seeds are NOT idempotent. False sense of security. By the time we
#      have real data we should be able to administer this stuff via an
#      authenticated session over the web (Administrate or similar).

wizard = Wizard.create name: 'Helping older Australians'

person_question = SingleChoiceQuestion.create wizard: wizard do |q|
  q.prompt = 'Are you looking for yourself or someone else?'
  q.options = [{ label: 'Myself', value: 'second'},
    { label: 'Someone else', value: 'third'}]
end

Interpolation.create wizard: wizard do |q|
  q.source = person_question
  q.name = 'subject'
  q.inflections = { second: 'you', third: 'they' }
end

Interpolation.create wizard: wizard do |q|
  q.source = person_question
  q.name = 'reverse-subject'
  q.inflections = { second: 'I', third: 'they' }
end

Interpolation.create wizard: wizard do |q|
  q.source = person_question
  q.name = 'possessive'
  q.inflections = { second: 'your', third: 'their' }
end

Interpolation.create wizard: wizard do |q|
  q.source = person_question
  q.name = 'one-is'
  q.inflections = { second: 'you\'re', third: 'they\'re' }
end

Interpolation.create wizard: wizard do |q|
  q.source = person_question
  q.name = 'reverse-one-is'
  q.inflections = { second: 'I\'m', third: 'they\'re' }
end

SingleChoiceQuestion.create wizard: wizard do |q|
  q.prompt = 'How old are %{subject}?'
  q.options = Option.quick_list 'Under 50', '50 to 64', '65 to 79', '80 to 95',
    '95 plus'
end

SingleChoiceQuestion.create wizard: wizard do |q|
  q.prompt = 'Which best describes %{possessive} current need?'
  q.options = Option.quick_list(
    '%{reverse-one-is:capitalize} thinking about the future',
    '%{reverse-one-is:capitalize} starting not to manage',
    '%{reverse-subject:capitalize} know that %{reverse-subject} need some help',
    '%{reverse-one-is:capitalize} in a crisis')
end

q_support = MultipleChoiceQuestion.create wizard: wizard do |q|
  q.prompt = 'What support are you interested in learning about?'
  q.options = Option.quick_list 'Help at home',
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

# location_question = LocationQuestion.create wizard: wizard do |q|
#   q.prompt = 'Where do you live?'
# end
#
# Interpolation.create wizard: wizard do |q|
#   q.source = location_question
#   q.name = 'location'
#   q.filters = 'first_word' # Maybe available filters can also be applied ad hoc?
#                            # e.g. %{subject:titleize}
# end

# MultipleChoiceQuestion.create wizard: wizard do |q|
#   q.prompt = 'What options are you interested in finding out about?'
#   q.options = Option.quick_list 'Living near to %{location}', 'Single storey',
#     'Supervision and support', 'Nursing care', 'Staying independent at home',
#     'Help in maintaining a home', 'Living in a community',
#     'Cultural connections', 'None of the above'
# end

hah = ResultCategory.create wizard: wizard do |c|
  c.title = 'Help at home'
  c.description = 'Get the help and advice you need to stay in your home,
    a family or a friend\'s home, or a retirement village.'
  c.rationale = 'Find out how to stay independent in your home by getting
    support for day-to-day activities, personal care, transport and nursing
    and health care.'
end

ghh = ResultGroup.create result_category: hah do |g|
  g.title = 'Getting home help'
  g.body = 'You can arrange for an assessor to visit you in your home so they
    can see your situation and work out the right help for you. They will then
    decide if the government should pay for some or all of your support
    services.'
end

Condition.create conditional: ghh, source: q_support do |c|
  c.operator = 'eq'
  c.comparators = ['staying-at-home']
end

TopicPageResult.create wizard: wizard, container: ghh do |r|
  r.title = 'Being assessed for support'
  r.path = '/help-for-older-people/being-assessed-for-support'
end

afa = ResultGroup.create result_category: hah do |g|
  g.title = 'Arrange for an assessment'
  g.body = 'If you would like an assessment in your home call My Aged Care.
    They will then recommend service providers, or give you a referral code
    to choose your own. Call Monday to Friday 8am to 8pm, or Saturday 10am
    to 2pm'
end

Condition.create conditional: ghh, source: q_support do |c|
  c.operator = 'eq'
  c.comparators = ['staying-at-home']
end

PhoneNumberResult.create wizard: wizard, container: afa do |r|
  r.phone_number = '1800 200 422'
end

ExternalLinkResult.create wizard: wizard, container: hah do |r|
  r.title = 'View SA Health website: Find a local home and community service provider'
  r.url = 'http://www.sahealth.sa.gov.au/wps/wcm/connect/public+content/sa+health+internet/health+services/hospitals+and+health+services+-+country+south+australia'
end

ExternalLinkResult.create wizard: wizard, container: hah do |r|
  r.title = 'View SA Health website: Find hospitals and health services'
  r.url = 'http://www.sahealth.sa.gov.au/wps/wcm/connect/public+content/sa+health+internet/health+services/hospitals+and+health+services+-+country+south+australia'
end
















#
