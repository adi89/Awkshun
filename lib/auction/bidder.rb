require_relative 'bid'
require_relative 'auction'

class Bidder
  attr_accessor :auctions, :name, :bids

  def initialize(name)
    @name = name
    @items = []
    @auctions = []
    @bids = []
  end

  def generate_bid(auction, amount)
    max_bid = auction.max_bid
    if valid_auction?(auction)
      if amount > max_bid
        @bids << Bid.new(amount, self, auction)
        @auctions << auction unless @auctions.include? auction
      else
        raise "bid too low (Bid should exceed #{max_bid})"
      end
    end
  end

private

  def valid_auction?(auction)
    raise("Enter valid auction object") unless auction.is_a? Auction
    auction.availablility ? true : raise("Auction is unavailable")
  end

  def to_s
    "#{self.name.capitalize}"
  end

end
