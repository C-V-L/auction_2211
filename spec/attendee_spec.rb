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

   it 'has a name and a budget' do
    expect(attendee.name).to eq("Megan")
    expect(attendee.budget).to eq(50)
   end
  end
end