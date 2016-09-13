json.question do
  json.(@question, :id, :prompt, :type)
  if @question.respond_to?(:options)
    json.options @question.options do |option|
      json.(option, :value, :label)
    end
  end
end

json.form do
  json.action question_answers_path(question_id: @question.id)
end
