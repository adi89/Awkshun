require_relative 'auction'
require 'pry-debugger'

class Bid

  attr_reader :bidder, :auction, :amount

  def initialize(amount, bidder, auction)
    @amount = floated(amount)
    @bidder = valid_bidder(bidder)
    @auction = valid_auction(auction)
    @bidder.bids << self
    @auction.bids << self
  end

  def update_bidder(bid)
    @bidder.bids << bid
  end

  private

  def valid_auction(auction)
    (auction.is_a? Auction) ? auction : raise("Enter Valid Auction Object")
  end

  def valid_bidder(bidder)
    (bidder.is_a? Bidder) ? bidder : raise("Enter Valid Bidder Object")
  end

  def floated(amount)
    amount.to_f
  end

end
