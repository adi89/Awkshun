require 'rake'

Gem::Specification.new do |s|
  s.name        = 'auction'
  s.version     = '0.0.0'
  s.date        = '2014-11-06'
  s.summary     = "auction app"
  s.description = ""
  s.authors     = ["Adi Singh"]
  s.email       = 'adityasingh89@gmail.com'
  s.homepage    =
    'http://rubygems.org/gems/auction_huff'
  s.license       = 'MIT'
  s.files       = [
                  "Gemfile",
                  "Gemfile.lock",
                  "lib/auction.rb",
                  "lib/auction/auction.rb",
                  "lib/auction/auctioneer.rb",
                   "lib/auction/bidder.rb",
                   "lib/auction/bid.rb",
                   "lib/auction/item.rb",
                   "lib/auction/main.rb"
                 ]

end