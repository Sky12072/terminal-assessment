require_relative "../welcome"
require_relative "../database"


describe "It should return the country of selected month and season" do

    it "dataresult should return the selected country" do
        $month = {:january}
        $season = {:summer}
        expect(questions.($dataresult = $data[$month][$season])).to eq(:Australia)
    end
end

describe "It should store data to the wishlist" do

    it "stores a country to a wishlist" do
        storage = {:Australia}
        expect(add_to_wishlist($wishlist = $wishlist.push(storage))).to eq(:Australia)
    end
end