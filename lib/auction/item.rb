require_relative 'auction'
require 'pry-debugger'

class Item

  attr_accessor :name, :auction
  attr_reader :reserved_price

  def initialize(name, price)
    @name = name
    @reserved_price = price_check(price)
    @auction = nil
  end

  protected

  def to_s
    "#{@name}"
  end

  def price_check(price)
     raise('Insert an Float value for price') unless (price.is_a?(Float) || price.is_a?(Integer))
      price.to_f
  end

  def key
    self.name
  end

end
