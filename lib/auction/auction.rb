require_relative 'bid'
require_relative 'item'
require_relative 'auctioneer'
# require_relative 'auctioneer'
# require_relative 'bidder'
class Auction

  attr_accessor :status, :bids, :availablility

  def initialize(item)
    @item = valid_item(item)
    @status = 'progress'
    @availablility = true
    @bids = []
  end

  def terminate
    self.availablility = false
    if max_bid > @item.reserved_price
      @status = "Success! Item sold at #{max_bid} to #{max_bidder}."
    else
      @status = "Failure. Item sold at #{max_bid} to #{max_bidder}."
    end
  end

  def max_bid
    if @bids.any?
      bid = @bids.max_by(&:amount)
      bid.amount
    else
      0
    end
  end

  def max_bidder
    if @bids.any?
      bid = @bids.max_by(&:amount)
      bid.bidder
    end
  end

  private

  def valid_item(item)
    if item.is_a? Item
      item
    else
      raise 'must add valid item'
    end
  end


end
