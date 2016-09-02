import test from 'ava'
import React from 'react'
import { shallow } from 'enzyme'
import sinon from 'sinon'

import Question from '../../app/components/Question'

const onSubmit = sinon.spy()
const questionData = {
  id: 1,
  prompt: 'Was Jackie Robinson the greatest baseball player?',
  options: [
    { label: 'Yes', value: 'yes' },
    { label: 'No', value: 'no' }
  ],
  onSubmit: onSubmit
}

const wrapper = shallow(<Question {...questionData} />)

test('will have a question title', t => {
  const heading = wrapper.find('legend')
  t.truthy(heading.length)
  t.is(heading.text(), 'Was Jackie Robinson the greatest baseball player?')
})

test('will display radio buttons', t => {
  t.true(wrapper.contains(<input type="radio" name="answer[options]" id="answer_yes" value="yes" />))
  t.true(wrapper.contains(<input type="radio" name="answer[options]" id="answer_no" value="no" />))
})

test('will display a submit button', t => {
  const button = wrapper.find('button[type="submit"]')

  t.truthy(button.length)
  t.true(wrapper.contains(<button type="submit">Next <i className="fa fa-chevron-right" aria-hidden="true"></i></button>))
})

test('will contain form container elements', t => {
  const form = wrapper.find('form')
  t.true(form.is('.form'))
  t.truthy(form.length)
  t.truthy(wrapper.find('fieldset').length)
})

test('will no props provided', t => {
  const wrapper = shallow(<Question />)
  const heading = wrapper.find('legend')
  const inputs = wrapper.find('input')
  t.truthy(heading.length)
  t.is(heading.text(), '')
  t.falsy(inputs.length)
})

/**
 * Skipping this suite until we integrate the API.
 */
test('simulate submit', t => {
  const preventDefault = sinon.spy()
  wrapper.find('form').simulate('submit', { preventDefault })
  t.skip.true(onSubmit.calledOnce)
  t.skip.true(preventDefault.calledOnce)
})
