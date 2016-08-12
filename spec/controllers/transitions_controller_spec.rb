require 'rails_helper'

RSpec.describe TransitionsController, type: :controller do
  describe 'GET #index' do
    before do
      get :index
    end

    it { is_expected.to respond_with 200 }
  end

  describe 'GET #show' do
    
  end
end
