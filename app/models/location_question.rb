class LocationQuestion < Question
  include Choosable

  def multiple_choice?
    false
  end
end
