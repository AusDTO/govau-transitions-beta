import test from 'ava';
import reducer from '../../app/reducers/landing'

test('should return the inital state', t => {
  t.deepEqual(reducer(void 0, {}), { name: '' })
})
