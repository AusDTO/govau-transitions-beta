import test from 'ava'
import actionTypes from '../app/constants'
import * as actions from '../app/actions'

test('should create an action to commit', t => {
  const expectedAction = {
    type: actionTypes.COMMIT
  }
  t.deepEqual(actions.commit(), expectedAction)
})

test('should create an action to select an answer', t => {
  const expectedAction = {
    type: actionTypes.SELECT_ANSWER,
    value: 'Hello World'
  }
  t.deepEqual(actions.selectAnswer('Hello World'), expectedAction)
})
