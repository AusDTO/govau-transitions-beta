import test from 'ava'
import reducer from '../../reducers/form'

test('should return the inital state', t => {
  t.deepEqual(reducer(void 0, {}), {})
})

test('passing no action but updated state', t => {
  t.deepEqual(reducer({ action: '/q/1/a' }, {}), { action: '/q/1/a' })
})
