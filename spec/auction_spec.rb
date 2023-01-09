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
  let(:item3) { Item.new('Homemade Chocolate Chip Cookies') }
  let(:item4) { Item.new('2 Days Dogsitting') }
  let(:item5) { Item.new('Forever Stamps') }
  
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
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      item4.add_bid(attendee3, 50)
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

    describe '#unpopular_items' do
      it 'can return an array with all items without bids' do
        expect(auction.unpopular_items).to eq([item2, item3, item5])
        item3.add_bid(attendee2, 15)
        expect(auction.unpopular_items).to eq([item2, item5])
      end
    end

    describe '#potential_revenue' do
      it 'can total the highest bids on each item' do
        item3.add_bid(attendee2, 15)
        expect(auction.potential_revenue).to eq(87)
      end
    end
  end

  describe 'IT3' do
    before(:each) do
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)
      item1.add_bid(attendee1, 22)
      item1.add_bid(attendee2, 20)
      item4.add_bid(attendee3, 50)
      item3.add_bid(attendee2, 15)
    end

    describe '#bidders' do
      it 'can return an array of attendees who have bid in the auction' do
        expect(auction.bidders).to contain_exactly(attendee1, attendee2, attendee3)
      end
    end

    describe '#bidder_info' do
      it 'can return a hash of bidders as keys and a hash of their budget and items bid on as a value' do
        expect_hash = {
                  attendee1 => {
                      :budget => 50,
                      :items => [item1]
                    },
                  attendee2 => {
                      :budget => 75,
                      :items => [item1, item3]
                    },
                  attendee3 => {
                      :budget => 100,
                      :items => [item4]
                    } }
        expect(auction.bidder_info).to eq(expect_hash)
      end
    end

    describe '#date' do
      it 'im not really sure what it does yet' do
        allow(auction).to receive(:date).and_return('26/03/2021')
        expect(auction.date).to eq('26/03/2021')
      end
    end
  end
end