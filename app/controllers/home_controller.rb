class HomeController < ApplicationController
  def index
    @default_props = {
      landing: {
        name: "Transitions"
      } 
    }
  end
end
