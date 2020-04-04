require 'open-uri'
require 'nokogiri'

class PagesController < ApplicationController
  def home
    bitstamp = JSON.parse(open("https://www.bitstamp.net/api/ticker/").string)
    @bitstamp_price = bitstamp["last"]

    bitfinex = JSON.parse(open("https://api-pub.bitfinex.com/v2/tickers?symbols=tBTCUSD").string)
    @bitfinex_price = bitfinex[0][7]

    coinbase = JSON.parse(open('https://api.coinbase.com/v2/prices/spot?currency=USD').string)
    @coinbase_price = coinbase["data"]["amount"]
  end

  def about
  end

end
