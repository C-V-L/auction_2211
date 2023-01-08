require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe "Item" do
  let(:item1) { Item.new('Chalkware Piggy Bank') }
  let(:item2) { Item.new('Bamboo Picture Frame') }
  let(:attendee) { Attendee.new(name: "Megan", budget: '$50') } 
  let(:auction) { Auction.new }
  
  describe '#initialize' do
    it 'exists' do
      expect(auction).to be_a(Auction)
    end
  end
end