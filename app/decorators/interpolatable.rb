module Interpolatable
  def interpolate(str)
    context[:answer_session]&.interpolate(str) || str
  end

  def decorate_interpolatably(thing)
    thing.decorate context: { answer_session: context[:answer_session] }
  end
end
