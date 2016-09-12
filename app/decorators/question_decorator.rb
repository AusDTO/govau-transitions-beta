class QuestionDecorator < Draper::Decorator
  include Interpolatable
  delegate_all

  def prompt
    interpolate object.prompt
  end
end
