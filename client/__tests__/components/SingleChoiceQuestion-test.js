import test from 'ava'
import React from 'react'
import { shallow } from 'enzyme'

import SingleChoiceQuestion from '../../app/components/SingleChoiceQuestion'

const props = {
  id: 1,
  options: [
    { label: 'Yes', value: 'yes' },
    { label: 'Of course!', value: 'ofcourse' }
  ]
}

test('should render with a div wrapper', t => {
  const wrapper = shallow(<SingleChoiceQuestion {...props} />)
  t.is(wrapper.type(), 'div')
})

test('should render radio buttons', t => {
  const wrapper = shallow(<SingleChoiceQuestion {...props} />)
  const input = wrapper.find('input').first()
  t.is(input.prop('name'), 'answer[options]')
  t.is(input.prop('className'), 'single-question__option')
  t.is(input.prop('id'), 'answer_yes')
  t.is(input.prop('value'), 'yes')
  t.is(input.prop('type'), 'radio')
})

test('rendering without props', t => {
  const wrapper = shallow(<SingleChoiceQuestion />)
  const inputs = wrapper.find('input')
  t.falsy(inputs.length)
})
