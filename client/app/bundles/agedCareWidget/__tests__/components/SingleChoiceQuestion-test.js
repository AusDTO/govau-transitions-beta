import test from 'ava'
import React from 'react'
import { shallow } from 'enzyme'

import SingleChoiceQuestion from '../../components/SingleChoiceQuestion'

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
  t.true(wrapper.contains(<input type="radio" name="answer[options]" className="single-question__option" id="answer_yes" value="yes" />))
  t.true(wrapper.contains(<input type="radio" name="answer[options]" className="single-question__option" id="answer_ofcourse" value="ofcourse" />))
})

test('rendering without props', t => {
  const wrapper = shallow(<SingleChoiceQuestion />)
  const inputs = wrapper.find('input')
  t.falsy(inputs.length)
})
