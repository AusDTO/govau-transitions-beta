json.question do
  json.(@question, :id, :prompt)
  json.options @question.options do |option|
    json.(option, :value, :label)
  end
end

json.form @widget_properties[:form]
