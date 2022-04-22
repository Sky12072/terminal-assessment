# require 'rspec/autorun'
require_relative '../methods'


describe "print name" do

    it "returns the input name" do
        expect(greetings("Tim")).to eq("Tim")
        
    end
end