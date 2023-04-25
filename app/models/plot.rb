class Plot < ApplicationRecord
  belongs_to :garden
  has_many :plot_plants
  has_many :plants, through: :plot_plants

  def less_than_100_harvest
    Plant.where('days_to_harvest < 100').distinct
  end
end


