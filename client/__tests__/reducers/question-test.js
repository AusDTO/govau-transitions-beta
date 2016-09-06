import test from 'ava'
import reducer from '../../app/reducers/question'

test('should return the inital state', t => {
  t.deepEqual(reducer(void 0, {}), {})
})

test('passing no action but updated state', t => {
  t.deepEqual(reducer({ id: 1, prompt: 'Tea or coffee?' }, {}), { id: 1, prompt: 'Tea or coffee?' })
})
