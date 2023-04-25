class Garden < ApplicationRecord
  has_many :plots


  def less_than_100_harvest
    Plant.where('days_to_harvest < 100').distinct
  end
end