import React, { PropTypes } from 'react'

const SingleChoiceQuestion = ({ options }) => (
  <div className="single-question">
    {options.map(({ label, value }, i) => (
      <span key={value + i}>
        <input type="radio" name="answer[options]" id={`answer_${value}`} className="single-question__option" value={value} />
        <label htmlFor={`answer_${value}`} className="single-question__label">{label}</label>
      </span>
    ))}
  </div>
)

SingleChoiceQuestion.propTypes = {
  options: PropTypes.arrayOf(PropTypes.shape({
    label: PropTypes.string.isRequired,
    value: PropTypes.string.isRequired
  })).isRequired
}

SingleChoiceQuestion.defaultProps = {
  options: []
}

export default SingleChoiceQuestion
