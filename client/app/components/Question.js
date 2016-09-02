import React, { PropTypes } from 'react'

const Question = ({ id, prompt, options }) => (
  <section className="content-main">
    <form className="form"
        method="post"
        action={'/questions/' + id + '/answers'}>
        <fieldset>
          <legend>{prompt}</legend>
          {options.map(({ label, value }, i) => (
            <span key={value + i}>
              <input type="radio" name="answer[options]" id={'answer_' + value} value={value} />
              <label htmlFor={'answer_' + value}>{label}</label>
            </span>
          ))}
        </fieldset>
        <button type="submit">Next <i className="fa fa-chevron-right" aria-hidden="true"></i></button>
    </form>
  </section>
)

Question.propTypes = {
  id: PropTypes.number.isRequired,
  prompt: PropTypes.string.isRequired,
  options: PropTypes.arrayOf(PropTypes.shape({
    label: PropTypes.string.isRequired,
    value: PropTypes.string.isRequired
  })).isRequired
}

export default Question
