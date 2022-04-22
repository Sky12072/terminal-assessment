
require_relative '../methods'
require 'colorize'

describe "print name" do

    it "returns the input name" do
        expect(greetings("Tim")).to eq("Tim")
        
    end
end

# describe "print name" do

#     it "returns the input name" do
#         expect(output(:Australia)).to eq(:Australia)
        
#     end
# end

# RSpec::Mocks.configuration.allow_message_expectations_on_nil = true

# describe "print out username" do

#     it "takes username input" do
#         # $name = "Tim"
#         greeting.stub(:gets).and_return('Tim')
#         expect(welcome).to eq('Tim')
#     end
# end

# describe greeting do

#     it "takes username input" do
#         $name = "Tim"
#         greeting.stub(:gets).and_return('Tim')
#         expect(greeting).to eq('Tim')
#         expect(greeting).to output("Tim").to_stdout
#     end
# end


# describe "print out username" do

#     it "takes username input" do
#         $name = "Tim"
#         expect(welcome).to eq('Tim')
#         expect(welcome).to output(/#{$name}/).to_stdout
#     end
# end






# describe "It should return the country of selected month and season" do

#     it "dataresult should return the selected country" do
#         $month = {:january}
#         $season = {:summer}
#         expect(questions.($dataresult = $data[$month][$season])).to eq(:Australia)
#     end
# end

# describe "It should store data to the wishlist" do

#     it "stores a country to a wishlist" do
#         storage = {:Australia}
#         expect(add_to_wishlist($wishlist = $wishlist.push(storage))).to eq(:Australia)
#     end
# end

# describe "goodbye" do

#     it "should return goodbye with a name as input" do
#         expect{goodbye}.to output("Tim").to_stdout
#     end
# end



# describe "goodbye" do

#     it 'should print "Thank you, #{$name} for using our service."' do
#         printed = capture_stdout do
#             goodbye
#         end
        
#         printed.should eq("Thank you, #{$name} for using our service.
#             Good luck with your future trip!")
#     end
# end


# describe "goodbye" do

#     it "should print 'Thank you'" do
#     expect (goodbye).to output("Thank you").to_stdout
#     end
# end
# RSpec::Mocks.configuration.allow_message_expectations_on_nil = true

# describe '#questions' do
#     it "returns the countries selected from month and season" do
#         questions.stub(:gets).and_return(:january, :summer)
#         expect(questions).to eq(:Australia, :'New Zealand', :Vanuatu)
#     end
# end

# describe '#add_to_wishlist' do
#     it "adds to wishlist" do
#         displayer.stub(:gets).and_return(:Australia)
#         expect(displayer.add_to_wishlist).to eq(:Australia)
#     end
# end