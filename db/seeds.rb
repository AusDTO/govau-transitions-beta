# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

wizard = Wizard.find_or_create_by! name: 'Test wizard'

q1 = SingleChoiceQuestion.find_or_create_by! wizard: wizard, prompt: 'Tea or coffee?'
q1.update_attribute :options, [{ value: 'tea', label: 'Tea' }, {value: 'coffee', label: 'Coffee' }]

q2 = SingleChoiceQuestion.find_or_create_by! wizard: wizard, prompt: 'Milk?'
q2.update_attribute :options, SingleChoiceQuestion::BOOLEAN_OPTIONS
