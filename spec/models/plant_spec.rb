require 'rails_helper'

RSpec.describe Plant do
  let!(:garden) {Garden.create!(name: "Turing Community Garden", organic: true)}
  let!(:plot1) {garden.plots.create!(number: 25, size: "Large", direction: "East")}
  let!(:plot2) {garden.plots.create!(number: 20, size: "Medium", direction: "East")}
  let!(:plot3) {garden.plots.create!(number: 15, size: "small", direction: "North")}

  let!(:tulip) {Plant.create(name: "Tulip", description: "Prefers rich, well draining soil.", days_to_harvest: 90)}
  let!(:rose) {Plant.create(name: "Rosebush", description: "Prefers dry soil.", days_to_harvest: 60)}
  let!(:bulb) {Plant.create(name: "Bulbs", description: "Prefers rich, wet soil.", days_to_harvest: 50)}
  let!(:tomato) {Plant.create(name: "Heirloom", description: "Prefers soil.", days_to_harvest: 120)}


  let!(:plot1_tulip) {PlotPlant.create!(plot_id: plot1.id, plant_id: tulip.id)}
  let!(:plot1_rose) {PlotPlant.create!(plot_id: plot1.id, plant_id: rose.id)}
  let!(:plot2_bulb) {PlotPlant.create!(plot_id: plot2.id, plant_id: bulb.id)}
  let!(:plot3_bulb) {PlotPlant.create!(plot_id: plot3.id, plant_id: bulb.id)}
  let!(:plot3_tomato) {PlotPlant.create!(plot_id: plot3.id, plant_id: tomato.id)}

  describe 'relationships' do
    it {should have_many :plot_plants}
    it {should have_many(:plots).through(:plot_plants)}
  end

  describe 'list only includes plants that take less than 100 days to harvest and is unique' do
    it '.less_than_100_harvest' do
      expect(Plant.less_than_100_harvest).to eq([rose, bulb, tulip])
    end
  end
end