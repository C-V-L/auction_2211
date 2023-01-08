require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe "Item" do
  let(:item1) { Item.new('Chalkware Piggy Bank') }
  let(:item2) { Item.new('Bamboo Picture Frame') }
  let(:attendee1) { Attendee.new(name: "Megan", budget: '$50') } 
  let(:attendee2) { Attendee.new(name: 'Bob', budget: '$75') }
  let(:attendee3) { Attendee.new(name: 'Mike', budget: '$100') }
  let(:auction) { Auction.new }
  
  describe 'IT1' do
    describe '#initialize' do
      it 'exists' do
        expect(auction).to be_a(Auction)
      end

      it 'starts with empty items array' do
        expect(auction.items).to eq([])
      end
    end

    describe '#add_item' do
      it 'can add an atem to the auction' do
        auction.add_item(item1)
        auction.add_item(item2)
        expect(auction.items).to eq([item1, item2])
      end
    end

    describe '#item_names' do
      it 'can return an array with the names of all items at auction' do
        auction.add_item(item1)
        auction.add_item(item2)
        expect(auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
      end
    end
  end

  describe 'IT2' do
    before(:each) do
      item3 = Item.new('Homemade Chocolate Chip Cookies')
      item4 = Item.new('2 Days Dogsitting')
      item5 = Item.new('Forever Stamps')
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
    end

    describe '#bids' do
      it 'can list bids' do
        expect(item1.bids).to eq({attendee2 => 20, attendee1 => 22})
      end
    end

    describe '#current_high_bid' do
      it 'can return the value of the highest bid' do
        expect(item1.current_high_bid).to eq(22)
      end
    end
    
  end
end