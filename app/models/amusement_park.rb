class AmusementPark < ApplicationRecord
  has_many :rides

  def alphabetical_rides
    list = rides.order(:name)
    binding.pry
  end
end
