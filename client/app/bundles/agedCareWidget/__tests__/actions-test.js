import test from 'ava'
import actionTypes from '../constants'
import * as actions from '../actions'

test('should create an action to go next', t => {
  const expectedAction = {
    type: actionTypes.MOVE_NEXT
  }
  t.deepEqual(actions.moveNext(), expectedAction)
})
