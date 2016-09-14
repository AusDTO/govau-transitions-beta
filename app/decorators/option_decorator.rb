class OptionDecorator < Draper::Decorator
  include Interpolatable

  def label
    interpolate object.label
  end

  def value
    object.value
  end
end
