module Interpolatable
  def interpolate(str)
    context[:answer_session]&.interpolate(str) || str
  end
end
