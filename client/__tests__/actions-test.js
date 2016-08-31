import test from 'ava'
import actionTypes from '../app/constants'
import * as actions from '../app/actions'

test('should create an action to go next', t => {
  const expectedAction = {
    type: actionTypes.MOVE_NEXT
  }
  t.deepEqual(actions.next(), expectedAction)
})
