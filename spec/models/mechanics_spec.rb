require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it {should have_many :mechanic_rides}
  end
end
