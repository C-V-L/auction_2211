class Auction
  attr_reader :items
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    @items.map do |item|
      if item.bids.count == 0
        item
      end
    end.compact
  end

  def potential_revenue
    rev = 0
    @items.each do |item|
      rev += item.current_high_bid
    end
    rev
  end

  def bidders
    list_of_bidders = []

    @items.each do |item|
      item.bids.each do |bid|
        list_of_bidders << bid[0] if !list_of_bidders.include?(bid[0])
      end
    end
    list_of_bidders
  end
end