=begin
Include this class for any Question type that needs to have a restricted set
of possible Answer values. (So far: SingleChoiceQuestion and
MultipleChoiceQuestion). The options are stored as a virtual array of Option
objects via the 'meta' attribute (PostgreSQL jsob type).
=end

module Choosable
  extend ActiveSupport::Concern

  included do
    store_attributes :meta do
      options Array[Option]
    end
  end
end
