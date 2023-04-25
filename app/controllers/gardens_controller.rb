class GardensController < ApplicationController
  def show
    @garden = Garden.find(params[:id])
    # require 'pry'; binding.pry
  end
end