require 'rails_helper'

RSpec.describe 'plot index', type: :feature do 
  let!(:garden) {Garden.create!(name: "Turing Community Garden", organic: true)}
  let!(:plot1) {garden.plots.create!(number: 25, size: "Large", direction: "East")}
  let!(:plot2) {garden.plots.create!(number: 20, size: "Medium", direction: "East")}
  let!(:plot3) {garden.plots.create!(number: 15, size: "small", direction: "North")}

  let!(:tulip) {Plant.create(name: "Tulip", description: "Prefers rich, well draining soil.", days_to_harvest: 90)}
  let!(:rose) {Plant.create(name: "Rosebush", description: "Prefers dry soil.", days_to_harvest: 60)}
  let!(:bulb) {Plant.create(name: "Bulbs", description: "Prefers rich, wet soil.", days_to_harvest: 50)}

  let!(:plot1_tulip) {PlotPlant.create!(plot_id: plot1.id, plant_id: tulip.id)}
  let!(:plot1_rose) {PlotPlant.create!(plot_id: plot1.id, plant_id: rose.id)}
  let!(:plot2_bulb) {PlotPlant.create!(plot_id: plot2.id, plant_id: bulb.id)}
  let!(:plot3_bulb) {PlotPlant.create!(plot_id: plot3.id, plant_id: bulb.id)}
  let!(:plot3_rose) {PlotPlant.create!(plot_id: plot3.id, plant_id: rose.id)}


  describe "US1 When I visit the plots index page ('/plots')" do
    it "I see a list of all plot numbers
    And under each plot number I see the names of all that plot's plants" do 
      visit '/plots'
      save_and_open_page

      expect(page).to have_content("Plot#25")
      expect(page).to have_content("Tulip")
      expect(page).to have_content("Rosebush")
      expect(page).to have_content("Plot#20")
      expect(page).to have_content("Bulbs")
      expect(page).to have_content("Plot#15")



    end
  end
end