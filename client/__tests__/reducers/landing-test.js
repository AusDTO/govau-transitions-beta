import test from 'ava'
import reducer from '../../app/reducers/landing'

test('should return the inital state', t => {
  t.deepEqual(reducer(void 0, {}), { name: '' })
})

test('passing no action but updated state', t => {
  t.deepEqual(reducer({ name: 'Bo' }, {}), { name : 'Bo' })
})
