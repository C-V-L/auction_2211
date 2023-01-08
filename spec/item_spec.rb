require './lib/item'

RSpec.describe "Item" do
  let(:item1) { Item.new('Chalkware Piggy Bank')}
  let(:item2) { Item.new('Bamboo Picture Frame')}

  describe '#initialize' do
    it 'exists' do
      expect(item1).to be_a(Item)
    end

    it 'has a name and starts with no bids' do
      expect(item1.name).to eq('Chalkware Piggy Bank')
      expect(item2.name).to eq('Bamboo Picture Frame')
      expect(item1.bids).to eq({})
    end
  end

  describe '#add_bid' do
  #Test with actual attendee objects in auction_spec
    it 'can add a bid to an item' do
      item1.add_bid("attendee", 20)
      expect(item1.bids).to eq({"attendee" => 20})
    end
  end

  describe '#current_high_bid' do
    it 'can return the value of the highest bid' do
      item1.add_bid("attendee", 20)
      item1.add_bid("attendee2", 40)
      expect(item1.current_high_bid).to eq(40)
    end
  end
end