json.question do
  json.(@question, :id, :prompt)
  if @question[:options].nil?
    json.options @question.options do |option|
      json.(option, :value, :label)
    end
  end
end

json.form @widget_properties[:form]
