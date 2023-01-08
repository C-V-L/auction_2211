require './lib/item'
require './lib/attendee'

RSpec.describe 'Attendee' do
  let(:item1) { Item.new('Chalkware Piggy Bank') }
  let(:item2) { Item.new('Bamboo Picture Frame') }
  let(:attendee) { Attendee.new(name: "Megan", budget: '$50') } 

  describe '#intitalize' do
   it 'exists' do
    expect(attendee).to be_a(Attendee)
   end
  end
end