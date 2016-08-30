module Choosable
  extend ActiveSupport::Concern

  included do
    store_attributes :meta do
      options Array[Option]
    end
  end
end
