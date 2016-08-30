import test from 'ava';
import React from 'react'
import { shallow, render } from 'enzyme';

import Landing from '../../app/components/Landing'

test('landing title will be displayed', t => {
  const wrapper = render(<Landing name="some kind of" />)
  t.is(wrapper.find('h2').text(), 'Welcome to some kind of Beta!')
})

test('the component will be wrapped by a `.container` class', t => {
  const wrapper = shallow(<Landing />)
  const widgetInner = wrapper.find('.container')
  t.is(widgetInner.is('.container'), true)
})
