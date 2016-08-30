import test from 'ava';
import React from 'react'
import { shallow } from 'enzyme';

import LandingWidget from '../../app/components/LandingWidget'

test('landing title will be displayed', t => {
  const wrapper = shallow(<LandingWidget />)
  t.is(wrapper.contains(<h2>Welcome to Transitions Beta!</h2>), true)
})

test('the component will be wrapped by a `.container` class', t => {
  const wrapper = shallow(<LandingWidget />)
  const fooInner = wrapper.find('.container')
  t.is(fooInner.is('.container'), true)
})
