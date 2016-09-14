class QuestionDecorator < Draper::Decorator
  include Interpolatable
  delegate_all

  def options
    object.options.collect do |option|
      decorate_interpolatably option
    end
  end

  def prompt
    interpolate object.prompt
  end
end
