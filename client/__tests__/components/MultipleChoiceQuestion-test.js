import test from 'ava'
import React from 'react'
import { shallow } from 'enzyme'

import MultipleChoiceQuestion from '../../app/components/MultipleChoiceQuestion'

const props = {
  id: 1,
  options: [
    { label: 'Pretty', value: 'pretty' },
    { label: 'Handsome', value: 'handsome' },
    { label: 'Good Looking!', value: 'goodlooking' }
  ]
}

test('should render with a div wrapper', t => {
  const wrapper = shallow(<MultipleChoiceQuestion {...props} />)
  t.is(wrapper.type(), 'div')
})

test('should render checkboxes', t => {
  const wrapper = shallow(<MultipleChoiceQuestion {...props} />)
  t.true(wrapper.contains(<input type="checkbox" name="answer[options]" className="multiple-question__option" id="answer_pretty" value="pretty" />))
  t.true(wrapper.contains(<input type="checkbox" name="answer[options]" className="multiple-question__option" id="answer_handsome" value="handsome" />))
  t.true(wrapper.contains(<input type="checkbox" name="answer[options]" className="multiple-question__option" id="answer_goodlooking" value="goodlooking" />))
})

test('rendering without props', t => {
  const wrapper = shallow(<MultipleChoiceQuestion />)
  const inputs = wrapper.find('input')
  t.falsy(inputs.length)
})
