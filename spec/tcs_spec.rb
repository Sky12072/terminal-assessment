# require 'rspec/autorun'
require_relative '../methods'

describe "print name" do

    it "returns the input name" do
        expect(greetings("Tim")).to eq("Tim")
        
    end
end




describe "travel activity" do

    it "returns Outdoor activity" do
        
        expect(indoor_outdoor("Outdoor")).to eq(["Hiking", "Sightseeing", "Carnival", "Landmarks", "Events"])
        
    end

    it "returns indoor activity" do
        expect(indoor_outdoor("Indoor")).to eq(["Fashion shopping", "Restaurants", "Souvenir", "Bakery", "Nightlife"])
    end
end