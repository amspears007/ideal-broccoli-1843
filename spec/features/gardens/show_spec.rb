require "rails_helper"

RSpec.describe 'Garden Show Page', type: :feature do
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

  describe "US3 I visit a garden's show page ('/gardens/:id')" do
    it "I see a list of plants that are included in that garden's plots and I see that this list is unique (no duplicate plants)
    And I see that this list only includes plants that take less than 100 days to harvest" do
      visit "/gardens/#{garden.id}"
      save_and_open_page

      within"h1" do
        expect(page).to have_content("Garden Show Page")
      end

      expect(page).to have_content("Rosebush")
      expect(page).to have_content("Bulb")
      expect(page).to have_content("Tulip")
      expect(page).to_not have_content("Heirloom")
      end
    end
  end