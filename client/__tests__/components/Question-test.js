import test from 'ava'
import React from 'react'
import { shallow } from 'enzyme'
import sinon from 'sinon'
import ReactTestUtils from 'react-addons-test-utils'

import Question from '../../app/components/Question'
import SingleChoiceQuestion from '../../app/components/SingleChoiceQuestion'

const onSubmit = sinon.spy()
const questionData = {
  id: 1,
  prompt: 'Was Jackie Robinson the greatest baseball player?',
  options: [
    { label: 'Yes', value: 'yes' },
    { label: 'No', value: 'no' }
  ],
  onSubmit: onSubmit,
  form: {
    action: '/q/1/a',
    csrf_param: 'auth_token',
    csrf_token: 'somerandomtoken'
  }
}

const wrapper = shallow(<Question {...questionData} />)

test('will have a question title', t => {
  const heading = wrapper.find('h3')
  const headingWrapper = wrapper.find('.heading')
  t.truthy(headingWrapper.length)
  t.truthy(heading.length)
  t.is(heading.text(), 'Was Jackie Robinson the greatest baseball player?')
})

test('will have a back button', t => {
  const backButton = wrapper.find('.back')
  t.truthy(backButton.length)
})

test('will display a SingleChoiceQuestion element', t => {
  t.is(wrapper.find(SingleChoiceQuestion).length, 1)
})

test('will display a submit button', t => {
  const button = wrapper.find('button[type="submit"]')
  t.truthy(button.length)
  t.true(wrapper.contains(<button type="submit">Next <i className="fa fa-chevron-right" aria-hidden="true"></i></button>))
})

test('will contain form container elements', t => {
  const form = wrapper.find('form')
  t.is(form.prop('action'), '/q/1/a')
  t.true(form.is('.form'))
  t.truthy(form.length)
  t.truthy(wrapper.find('fieldset').length)
})

test('with no props provided', t => {
  const wrapper = shallow(<Question />)
  const heading = wrapper.find('h3')
  t.truthy(heading.length)
  t.is(heading.text(), '')
})

test('generateQuestionElement without type', t => {
  const q = new Question({ options: [] })
  t.true(ReactTestUtils.isElementOfType(
    q.generateQuestionElement(),
    SingleChoiceQuestion
  ))
})

test('generateQuestionElement with type', t => {
  const q = new Question({ options: [] })
  t.true(ReactTestUtils.isElementOfType(
    q.generateQuestionElement('single'),
    SingleChoiceQuestion
  ))
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
