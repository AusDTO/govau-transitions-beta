import React, { PropTypes } from 'react'

const Question = ({ id, prompt, meta = { options: [] }, legend }) => (
  <section className="content-main">
    <h3>{prompt}</h3>
    <form className="form"
        method="post"
        action={'/questions/' + id + '/answers'}>
        <fieldset>
          <legend>{legend}</legend>
          {meta.options.map(({ label, value }, idx) => (
            <span key={value + idx}>
              <input type="radio" name="answer[options]" id={'answer_' + value} value={value} />
              <label htmlFor={'answer_' + value}>{label}</label>
            </span>
          ))}
        </fieldset>
        <button type="submit">Next <i className="fa fa-chevron-right" aria-hidden="true"></i></button>
    </form>
  </section>
)

Question.PropTypes = {
  id: PropTypes.number.isRequired,
  prompt: PropTypes.string.isRequired,
  meta: PropTypes.arrayOf(PropTypes.shape({
    options: PropTypes.object.isRequired
  }))
}

export default Question
