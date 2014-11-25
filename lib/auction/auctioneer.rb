require_relative 'item'
require_relative 'auction'
require 'pry-debugger'

class Auctioneer

  attr_accessor :bids, :items, :name

  def initialize(name)
    @name = name
    @items = {}
    @bids = []
  end


  def add_items(items)
    items.each do |item|
      add_item(item)
    end
  end

  def add_item(options = {})
    @items[options[:name]] = Item.new(options[:name], options[:price]) unless @items[options[:name]]
  end

  def start_auction(item_name)
    if item = @items[item_name]
      auction =  Auction.new(item)
      item.auction ||= auction
    end
  end

  def end_auction(item)
    if auction = item.auction
      auction.terminate
    end
  end

  def available_auctions
    @items.map{|i| i.auction}.flatten.select{|i| i.available == true}
  end


end
