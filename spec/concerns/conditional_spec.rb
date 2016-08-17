require 'rails_helper'

describe Conditional do
  with_model :DummyConditional do
    table do |t|
      t.string :ingredients
      t.string :instructions
    end

    model do
      include Conditional

      # has many conditions

      ################ HEY DOES THIS REALLY REQUIRE A DUMMY MODEL?
    end
  end
end
