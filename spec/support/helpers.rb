module Helpers
  def with_human_numbers(upto: 10)
    upto.times do |i|
      yield (i + 1).humanize
    end
  end
end
